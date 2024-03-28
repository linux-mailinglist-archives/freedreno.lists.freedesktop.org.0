Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B90890DAC
	for <lists+freedreno@lfdr.de>; Thu, 28 Mar 2024 23:36:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D53C10E79D;
	Thu, 28 Mar 2024 22:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="OvzjuBoY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A36A10E79D
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 22:36:18 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc74435c428so1527990276.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 15:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711665377; x=1712270177; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LjY+wgOUFRoXu57CnEBA1CkVg+Yjx2wYh83Heq0qxKg=;
 b=OvzjuBoYeT5vRYhb4iOaccNfA+gpTArWodjYRNL+Ao90vwdUReYeateL0c+VZAci/i
 90PFi52MeRACtJnrXGJE1lkNuxCNyk7c9GARlKc6SdPRUYr0ey1iiYsTv9bfZ+oxOtd5
 kVRXVq58+/CA7MEQT9QVh7CIb7od9012PqwlJkw2aBBtI/PZFczynWxRdWN1MNHkkN08
 JOp7Xnfj+QljzOv2e1XLC2U5NcQ/OlsM+X2KLdD2Pw9h7BixtltBYWSF0Fs5pEVppAee
 q7JS6R46QSR6Aha0Qrjm6OM36jLOnqWcAFcMxH/ePmdPCGRCdZavfGgErB6r5SDeL1ih
 zRhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711665377; x=1712270177;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LjY+wgOUFRoXu57CnEBA1CkVg+Yjx2wYh83Heq0qxKg=;
 b=EJH8mU0tq7y4lijqvR941Q8enhjfCHHV9FWg5PeSpUuDe8KA4wBKhQ901zrzVC91+o
 //fwxKl6ePe6juTEwPzrL5hvQpPo9Ye92tY2VvjVjC+zf9lZ1yw6O0N95FrYlC9z03he
 EQdflcIFevAIOWbl5fHyPrksY6vVfRgS87Sk1UZDxWpMMKFrN2mifHprGxNzmETgtRvL
 aEO44UtWC2BFeiSbutDAVG6Hpgycx98/0cLgeCT+5MDUSjHE1IZjpFKLk2VrEux7xXXp
 3fa46c+vPudlcyT3v+d9cbzsKC5GlGHQ6rGSBoOK2lwNTmdgMfWod9Ub4fGbn8DMVSSo
 SdFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZRp5A/edZ/7DMgA/HBg36G1C1BtS5xtTJgqdjZ27cnBJQg/DG69UjfVmTDr9Ejg+dv4kCTImwaZOT4cC8w6oBfTgQxihccquiyeTNP70e
X-Gm-Message-State: AOJu0YyhoKoylCAmOrBFgoeFugmW4Y3fBAzbnFQpacr8qtqFj0Lwcp07
 vu/cH38YKb/CUylI1vx9YAGeJN7JBtYEv6ILRAf0UcqK14GVEuoMD4lMG0K5ruRImuHw3FpblWF
 x1mKXQ4p0muyErJkz6s3ozG+0FIoEnuw8QZ4XYw==
X-Google-Smtp-Source: AGHT+IHaI+kjiLOUYNKBR/srDk7VFG1X/iL9Lyrl5XxlS/w0akawROX6LC6YYP28982DF251YeuCQALSFyoyvb3mAX4=
X-Received: by 2002:a5b:183:0:b0:dcd:24b6:1ae7 with SMTP id
 r3-20020a5b0183000000b00dcd24b61ae7mr643047ybl.63.1711665377097; Thu, 28 Mar
 2024 15:36:17 -0700 (PDT)
MIME-Version: 1.0
References: <1711660035-9656-1-git-send-email-quic_khsieh@quicinc.com>
 <6641b5c9-1685-3d90-ac15-0b2e9d546bc5@quicinc.com>
In-Reply-To: <6641b5c9-1685-3d90-ac15-0b2e9d546bc5@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 00:36:06 +0200
Message-ID: <CAA8EJpoXgtodevy_AHGRR8o3yB08dK1oeHdWUrnx13rsYgY=Dg@mail.gmail.com>
Subject: Re: [PATCH v1] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, 
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com, 
 agross@kernel.org, abel.vesa@linaro.org, andersson@kernel.org, 
 quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com, 
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, 28 Mar 2024 at 23:36, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/28/2024 2:07 PM, Kuogee Hsieh wrote:
> > Currently qmp_combo_dp_power_on() always return 0 in regardless of
> > return value of cfg->configure_dp_phy(). This patch propagate
> > return value of cfg->configure_dp_phy() all the way back to caller.
> >
>
> This is good. But I am also thinking if we should add some prints in
> this driver like it doesnt even tell where it failed like here
>
>
>          ret = qmp_v456_configure_dp_phy(qmp);
>          if (ret < 0)
>                  return ret;
>
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 5 +++--
> >   1 file changed, 3 insertions(+), 2 deletions(-)
> >
>
> Also, I think we should have
>
> Fixes: 94a407cc17a4 ("phy: qcom-qmp: create copies of QMP PHY driver")
>
> If there is a better fixes tag for this, please let me know.

Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")

Otherwise LGTM

>
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index 36632fa..884973a 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -2754,6 +2754,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >       const struct qmp_phy_cfg *cfg = qmp->cfg;
> >       void __iomem *tx = qmp->dp_tx;
> >       void __iomem *tx2 = qmp->dp_tx2;
> > +     int ret = 0;
> >
> >       mutex_lock(&qmp->phy_mutex);
> >
> > @@ -2766,11 +2767,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >       cfg->configure_dp_tx(qmp);
> >
> >       /* Configure link rate, swing, etc. */
> > -     cfg->configure_dp_phy(qmp);
> > +     ret = cfg->configure_dp_phy(qmp);
> >
> >       mutex_unlock(&qmp->phy_mutex);
> >
> > -     return 0;
> > +     return ret;
> >   }
> >
> >   static int qmp_combo_dp_power_off(struct phy *phy)



-- 
With best wishes
Dmitry
