Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC40377088
	for <lists+freedreno@lfdr.de>; Sat,  8 May 2021 09:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC386E09A;
	Sat,  8 May 2021 07:58:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C55F6E09A
 for <freedreno@lists.freedesktop.org>; Sat,  8 May 2021 07:58:13 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id v24so10948136oiv.9
 for <freedreno@lists.freedesktop.org>; Sat, 08 May 2021 00:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to; bh=Uw9Olfn2D8yzVfU3MJmVflzhzFabExtk1M2ft9XYJsU=;
 b=ODWfTkzhtdY+iO1STfLTqoWZo1FgeWy/Rh+y88jZXZOuUKRyhbe10GSJvCa//KzEG6
 oq4Y/yFABv678zU21xy2Sv8WfudBkEnCN+Jz+CoVy2jYLU3m5juKT7bn2CbPODwg/RiA
 JjAKRoZkexVzG2VEOb8nxJlTl4N5fwDQsW5jI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to;
 bh=Uw9Olfn2D8yzVfU3MJmVflzhzFabExtk1M2ft9XYJsU=;
 b=bxxm2J3xtW0jgNLltoRDuvHfxdLRpSnhqHZKVv2Qjse2OfuXMVOb57eSSopQHiTmhI
 PonXyocg7Z/a7P59JfeLY+BgH1w4qGoBDApp+WSz8/ndYhnRF7+faIVNDA1gJURjoLeu
 d0L0/hKaSSw8uGYJvsjBX19VolH2Bdjj/E4rpUmsU/CDQD2QkQGXxOAa/Q4yHqzybn2x
 9JGcsx1FHxDYNoVY5n+UvFQlin3Bza6wcOXP0oSlyc8hvCur8ikdgj8MbiAZLNKuLJwX
 UUkHemHsQ5OJIj+30qyDiuBpKINSTvwUsW+uI01KJKMt0B1Bybr6aY2ZwcxLh8oIOqec
 dSXQ==
X-Gm-Message-State: AOAM530M7vc9ZnMWss9dWa5ZcVCu3E/jgtWydRwyZ1V/Rbh62qZR8p92
 FPj4Npy+A/9wA60612loUbtVdAkMiiq6KZrRZ2SM0A==
X-Google-Smtp-Source: ABdhPJzrNGN1d3ArMyBqXNzK81NAUjTSujijWd+FBZXWmyAwv5ebCgCLG+Xb0meYDyj+0NecXnNTw7K8ngzlJGc3SWE=
X-Received: by 2002:aca:654d:: with SMTP id j13mr17878718oiw.125.1620460693146; 
 Sat, 08 May 2021 00:58:13 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 8 May 2021 03:58:12 -0400
MIME-Version: 1.0
In-Reply-To: <4f6ab4db-958d-c2c5-7879-aa9a0d3b87ae@huawei.com>
References: <20210508024254.1877-1-thunder.leizhen@huawei.com>
 <CAE-0n51owL8RGJyz_5BUCTjrUW5m0X-DTKUx=mqRL=-4i-tMDA@mail.gmail.com>
 <4f6ab4db-958d-c2c5-7879-aa9a0d3b87ae@huawei.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Sat, 8 May 2021 03:58:12 -0400
Message-ID: <CAE-0n51bPtbw4gx4EOTd2wNq6gcH9yCuR_e8kqBo0-+7unUz5A@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Leizhen <thunder.leizhen@huawei.com>, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [Freedreno] [PATCH 1/1] drm/msm/dpu: Fix error return code in
 dpu_mdss_init()
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Leizhen (ThunderTown) (2021-05-08 00:55:04)
>
>
> On 2021/5/8 14:09, Stephen Boyd wrote:
> > Quoting Zhen Lei (2021-05-07 19:42:54)
> >> Fix to return a negative error code from the error handling case instead
> >> of 0, as done elsewhere in this function.
> >>
> >> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
> >> Reported-by: Hulk Robot <hulkci@huawei.com>
> >> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> >> ---
> >>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 4 +++-
> >>  1 file changed, 3 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >> index 06b56fec04e0..1b6c9fb500a1 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> >> @@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
> >>                 goto irq_domain_error;
> >>
> >>         irq = platform_get_irq(pdev, 0);
> >> -       if (irq < 0)
> >> +       if (irq < 0) {
> >> +               ret = irq;
> >>                 goto irq_error;
> >> +       }
> >
> > It would be even better if ret wasn't assigned to 0 at the start of this
> > function.
>
> The returned error code is not unique.
>

What does it mean? I was saying this

----8<----
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index cd4078807db1..0fcf190f6322 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -263,7 +263,7 @@ int dpu_mdss_init(struct drm_device *dev)
 	struct msm_drm_private *priv = dev->dev_private;
 	struct dpu_mdss *dpu_mdss;
 	struct dss_module_power *mp;
-	int ret = 0;
+	int ret;
 	int irq;

 	dpu_mdss = devm_kzalloc(dev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
@@ -297,8 +297,10 @@ int dpu_mdss_init(struct drm_device *dev)
 		goto irq_domain_error;

 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto irq_error;
+	}

 	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
 					 dpu_mdss);
@@ -309,7 +311,7 @@ int dpu_mdss_init(struct drm_device *dev)

 	dpu_mdss_icc_request_bw(priv->mdss);

-	return ret;
+	return 0;

 irq_error:
 	_dpu_mdss_irq_domain_fini(dpu_mdss);
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
