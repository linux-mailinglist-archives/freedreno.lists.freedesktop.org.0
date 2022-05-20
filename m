Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24652EFF6
	for <lists+freedreno@lfdr.de>; Fri, 20 May 2022 18:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1128710E791;
	Fri, 20 May 2022 16:03:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA3F910E600
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 16:03:49 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id x65so2945832qke.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 May 2022 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MdtVgPrWdCotf9wN05tQ+Fm3z+o2BvCtpjvU0RkkeHQ=;
 b=OsHMli1EJDxKXD0oi4SI7BaQUT1mjWDBkNrth0PCuX6BjsKhbMRNNEJzRIAgWpMl4z
 FGjHEJw1fvk4l7PKUjSUZmZCqcnHe+c43wexzoH178vn1P9Drtlbx9FscKjKPIDp+gUC
 T0x+kjKdJtMzvE9TQqSsmQpt6eSng1upz0HbOkRCuk03vPSQd8vxDcJYneFSIbzuchxn
 eYHLDPeYauskzn826Zu3eH4yUPm20noiaBFKz5mN6kkB1BUWtp/Svlg9aGajFByOGvj6
 ygElPF7dN2wNSlLp+alJ3+4vv89ibYmWa/45f0U3ZUqfvK2JzfaCTzYSN4SztwnlvdNu
 XbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MdtVgPrWdCotf9wN05tQ+Fm3z+o2BvCtpjvU0RkkeHQ=;
 b=bLO4WPx8YC09cKGZa9X6MGekUkBVZrSi0Hmy0PCxrnmC+SyXckIAxyGkITAGtF3Di2
 uNVmADyFwPt6NwlWU3jJG1vO7VscOdmwRdI7NvetQicU7UxKUfw2ONB7zrJfEfU9pZcs
 rLcoLNyNTHMNxermZRD64CogWDZnTEeIW6Q7cMflfwOjwxagx9A9d3rPfTO+DpuGIsBh
 OnmEc0O7p2DtY9Dv18O+fqc4toA4ca8mVY4JY4ivJxunan0/r5b5jFnBnquMlKNhII09
 ZH7HjnTEAQ9F7OdDMuKXe2Cg4IvjYoDOD22cCDW+G9dPgdX4OIyGyJ9jx84XT9xX/cdy
 vZAw==
X-Gm-Message-State: AOAM532b8k8jMNuXHcGCzXT0K0fEIZOq1yrdnUaZ/pJgC+Tb1OnwkqIw
 Vd8LzLGeva0a3B6Oku5y2NAD3LXL7XoRPBRtyZuSvQ==
X-Google-Smtp-Source: ABdhPJzLjUPH898P83+vLG4zDKSCgyesRwhebPGxJnX+Fd1ta1QNiUqPpPdwg3enEOBka0JBQPB7eL6M+5RJN8NwMag=
X-Received: by 2002:a37:582:0:b0:6a3:2ce4:3c72 with SMTP id
 124-20020a370582000000b006a32ce43c72mr6289694qkf.203.1653062628721; Fri, 20
 May 2022 09:03:48 -0700 (PDT)
MIME-Version: 1.0
References: <1653060079-11086-1-git-send-email-quic_khsieh@quicinc.com>
 <1653060079-11086-2-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1653060079-11086-2-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 May 2022 19:03:37 +0300
Message-ID: <CAA8EJpp6dF_44=_ZsYP46JabV-MyW+3NtpKi45z4=m5wYhR7zA@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v7 1/3] phy: qcom-edp: add
 regulator_set_load to edp phy
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, robdclark@gmail.com,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, vkoul@kernel.org,
 agross@kernel.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, quic_aravindh@quicinc.com, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Fri, 20 May 2022 at 18:21, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> eDP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index cacd32f..6715dd2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -87,14 +87,20 @@ struct qcom_edp {
>
>         struct clk_bulk_data clks[2];
>         struct regulator_bulk_data supplies[2];
> +       int enable_load[2];
>  };
>
>  static int qcom_edp_phy_init(struct phy *phy)
>  {
>         struct qcom_edp *edp = phy_get_drvdata(phy);
>         int ret;
> +       int num_consumers = ARRAY_SIZE(edp->supplies);

Please. Leave the ARRAY_SIZE in place, rather than moving it to the variable.

> +       int i;
>
> -       ret = regulator_bulk_enable(ARRAY_SIZE(edp->supplies), edp->supplies);
> +       for (i = 0; i < num_consumers; i++)
> +               regulator_set_load(edp->supplies[i].consumer, edp->enable_load[i]);
> +
> +       ret = regulator_bulk_enable(num_consumers, edp->supplies);
>         if (ret)
>                 return ret;
>
> @@ -635,6 +641,8 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
>
>         edp->supplies[0].supply = "vdda-phy";
>         edp->supplies[1].supply = "vdda-pll";
> +       edp->enable_load[0] = 21800;    /* load for 1.2 V vdda-phy supply */
> +       edp->enable_load[1] = 36000;    /* load for 0.9 V vdda-pll supply */
>         ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(edp->supplies), edp->supplies);
>         if (ret)
>                 return ret;
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


-- 
With best wishes
Dmitry
