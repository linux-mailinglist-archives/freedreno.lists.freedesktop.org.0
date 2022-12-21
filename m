Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1F2653290
	for <lists+freedreno@lfdr.de>; Wed, 21 Dec 2022 15:43:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3F810E455;
	Wed, 21 Dec 2022 14:43:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE7C10E455
 for <freedreno@lists.freedesktop.org>; Wed, 21 Dec 2022 14:43:38 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 hd14-20020a17090b458e00b0021909875bccso3520122pjb.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Dec 2022 06:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IyW++2grHjl8J45d/2q3DxB6TJXLGyoaKqQ8S90iPAw=;
 b=JwcBi8Mk+n+BRfCLl7cSqbrJjPeQAMpIMzuzVVbz7UEk9bGfgDNKY8nXyg0CyOyIt/
 ubbg606HpZ/6sJlH/0CZitVijUPDKFXn69O+XpmGg6+dLyrQysjwKEpLZM+HMcSFFeqU
 T3IRNg6mZ4F/aqnC/4beIRjC33YQwVSPSixMeE23GyB3wSywM1HVdTOaD8dktnTVMMrK
 dl7QplP1kP60YXb5UK1GvRUH5B+Zj/cyt/XD4X2nH4arqpOqBJJD44ljqlSbMP2xXsLW
 zS+NvuqhG8MTh1LmpSe/CVuOy1AMoHw+vHzsEtnHD/7qTFy45Auw9eJZTJQTLts8KxhS
 jkvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IyW++2grHjl8J45d/2q3DxB6TJXLGyoaKqQ8S90iPAw=;
 b=spYNgr1mS1wLeG1QkmIeHMdfh0dLXSuDIYzbqnjjcCSWX7b/KiUFEf7iAzf38CfcsD
 jhi6QqwbAnJ79UALLsj40+1CmzGGnYoutwh+/wyrLZcf9ZN5x+JBpo/R40idtRc9Auy+
 HR7hjDeeREMern2HojajSWNJIDlKk+iUNPO171qJO4ogagsRZJyEqCQDWGuPShtXRbae
 NzC8gKk+ss+jpTCfSJfaqemHE2plbqHPNkwsUVgEvCTSnMShKzoNyzDwHIVVjPibsXNg
 nNA+bc8ziKB8VA8roa/e341XAc+mm1jhTkSSijsRZWfrgCUUm2YwXQHcjwXVXjUwywEu
 8okA==
X-Gm-Message-State: AFqh2koMW+sNGooYUdke/xUUhzmnK321CXTxFIQ93oi9fvHdIeFumwD+
 LdzeTcIu6hcsifmQYzETGuRwSKstSQqR8d61r+Uu8w==
X-Google-Smtp-Source: AMrXdXvCHGKgNiRJjAKvBrn8TFRX9lSKbtiwl6JC1JfpRNHfJRtETCwT+Zv/FXciPqBeqqKNLPL9r+PBfxqx5PpG9q0=
X-Received: by 2002:a17:90a:be0c:b0:219:ef02:a5eb with SMTP id
 a12-20020a17090abe0c00b00219ef02a5ebmr226260pjs.84.1671633818076; Wed, 21 Dec
 2022 06:43:38 -0800 (PST)
MIME-Version: 1.0
References: <1671522257-38778-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221220131255.v3.1.I3e6b1f078ad0f1ca9358c573daa7b70ec132cdbe@changeid>
In-Reply-To: <20221220131255.v3.1.I3e6b1f078ad0f1ca9358c573daa7b70ec132cdbe@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Dec 2022 15:43:01 +0100
Message-ID: <CAPDyKFr6Hf5gbJ9T9scYqDrg9tmKmVAm=h1J7r3GZzcogk5HpQ@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 1/5] PM: domains: Allow a genpd consumer
 to require a synced power off
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
Cc: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 Kevin Hilman <khilman@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 20 Dec 2022 at 08:44, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> From: Ulf Hansson <ulf.hansson@linaro.org>
>
> Some genpd providers doesn't ensure that it has turned off at hardware.
> This is fine until the consumer really requires during some special
> scenarios that the power domain collapse at hardware before it is
> turned ON again.
>
> An example is the reset sequence of Adreno GPU which requires that the
> 'gpucc cx gdsc' power domain should move to OFF state in hardware at
> least once before turning in ON again to clear the internal state.
>
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Minor formatting fix
>
>  drivers/base/power/domain.c | 23 +++++++++++++++++++++++
>  include/linux/pm_domain.h   |  5 +++++
>  2 files changed, 28 insertions(+)
>
> diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
> index 967bcf9d415e..53524a102321 100644
> --- a/drivers/base/power/domain.c
> +++ b/drivers/base/power/domain.c
> @@ -519,6 +519,28 @@ ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_get_next_hrtimer);
>
> +/*
> + * dev_pm_genpd_synced_poweroff - Next power off should be synchronous
> + *
> + * @dev: A device that is attached to the genpd.
> + *
> + * Allows a consumer of the genpd to notify the provider that the next power off
> + * should be synchronous.

Nitpick; similar to other dev_pm_genpd_* function-descriptions, I
think it's important to add the below information.

"It is assumed that the users guarantee that the genpd wouldn't be
detached while this routine is getting called."

Can you please add that?

> + */
> +void dev_pm_genpd_synced_poweroff(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd;
> +
> +       genpd = dev_to_genpd_safe(dev);
> +       if (!genpd)
> +               return;
> +
> +       genpd_lock(genpd);
> +       genpd->synced_poweroff = true;
> +       genpd_unlock(genpd);
> +}
> +EXPORT_SYMBOL_GPL(dev_pm_genpd_synced_poweroff);
> +
>  static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>  {
>         unsigned int state_idx = genpd->state_idx;
> @@ -562,6 +584,7 @@ static int _genpd_power_on(struct generic_pm_domain *genpd, bool timed)
>
>  out:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_ON, NULL);
> +       genpd->synced_poweroff = false;
>         return 0;
>  err:
>         raw_notifier_call_chain(&genpd->power_notifiers, GENPD_NOTIFY_OFF,
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 1cd41bdf73cf..f776fb93eaa0 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -136,6 +136,7 @@ struct generic_pm_domain {
>         unsigned int prepared_count;    /* Suspend counter of prepared devices */
>         unsigned int performance_state; /* Aggregated max performance state */
>         cpumask_var_t cpus;             /* A cpumask of the attached CPUs */
> +       bool synced_poweroff;           /* A consumer needs a synced poweroff */
>         int (*power_off)(struct generic_pm_domain *domain);
>         int (*power_on)(struct generic_pm_domain *domain);
>         struct raw_notifier_head power_notifiers; /* Power on/off notifiers */
> @@ -235,6 +236,7 @@ int dev_pm_genpd_add_notifier(struct device *dev, struct notifier_block *nb);
>  int dev_pm_genpd_remove_notifier(struct device *dev);
>  void dev_pm_genpd_set_next_wakeup(struct device *dev, ktime_t next);
>  ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev);
> +void dev_pm_genpd_synced_poweroff(struct device *dev);
>
>  extern struct dev_power_governor simple_qos_governor;
>  extern struct dev_power_governor pm_domain_always_on_gov;
> @@ -300,6 +302,9 @@ static inline ktime_t dev_pm_genpd_get_next_hrtimer(struct device *dev)
>  {
>         return KTIME_MAX;
>  }
> +static inline void dev_pm_genpd_synced_poweroff(struct device *dev)
> +{ }
> +
>  #define simple_qos_governor            (*(struct dev_power_governor *)(NULL))
>  #define pm_domain_always_on_gov                (*(struct dev_power_governor *)(NULL))
>  #endif
> --
> 2.7.4
>

Kind regards
Uffe
