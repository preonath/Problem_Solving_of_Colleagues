library(tidyverse)
df = read_table("poptest")
df2 = df %>% select(t, N, N_A, N_a) 
df3 = df2 %>% pivot_longer(cols = -c("t"))
ggplot(df3, aes(x=t, y=value, color=name)) + geom_line()


df4 =  df %>% select(t, fA, fa) %>% pivot_longer(cols = -c("t"))
ggplot(df4, aes(x=t, y=value, color=name)) + geom_line()


df = read_table("res.1")
df2 =  df %>% select(t, N, N_A, N_a) %>% pivot_longer(cols = -c("t"))
ggplot(df2, aes(x=t, y=value, color=name)) + geom_line()


df3 =  df %>% select(t, fA, fa) %>% pivot_longer(cols = -c("t"))
ggplot(df3, aes(x=t, y=value, color=name)) + geom_line()

dat = read_table("modelfit.data")
print(dat)


ggplot(dat, aes(x=t, y=N)) + geom_line()



train = dat %>% filter(t<14)
print(train)



N0_init = ???
  r_init = ???
  xpred = seq(0, 15, 0.1)
ypred = N0_init * exp(r_init * xpred)
dfpred = tibble(x=xpred, y=ypred)
ggplot(train, aes(x=t, y=N)) + 
  geom_point() + 
  geom_line(dfpred, mapping=aes(x=x, y=y), color="blue")