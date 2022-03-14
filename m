Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE614D8C57
	for <lists+freedreno@lfdr.de>; Mon, 14 Mar 2022 20:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAAB310E20F;
	Mon, 14 Mar 2022 19:25:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7DE10E20F
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 19:25:56 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id k125so8279146qkf.0
 for <freedreno@lists.freedesktop.org>; Mon, 14 Mar 2022 12:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ghXEBznY5vyHF7+fdWoY5v3OsItcalBlY/KG9K7yOhU=;
 b=e2Ud08S0Q7pZF215eRKz7vixHUKMgQNfUK9aOMWNfqStkSdZvWC5Mszd1gEoj/cIZz
 IrZAiRKPJytuFVu+isbnZ5e2rAWsyFV79zcMh9/gmlkX6+VS8y5uGJTay/iSQjW/XKar
 ayFug9ECos7jYnvjtc0aR6Qmtns5qgU5i4/dof+t3R4fwNzT32kHj5wHd1lmFVGOpo3c
 VzjLN9YEOS+PZOQ5vDnQHZ+wSvqk5QfEgoYhbfvKDBo0BAVVKdSnMYOyilpqGop0zHsL
 5HjdxNO1dsVE598rdiHBPM9joHRTxK2XG7aFr29FLlMOR3LRz/PPhkSKnpJmFSQHlnr4
 N8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ghXEBznY5vyHF7+fdWoY5v3OsItcalBlY/KG9K7yOhU=;
 b=LdPrgAxM5wveCOYepzOQSGt+Lps7p8K4CfdRZu6LuKJGpuOEbHqHYKgi43M41lgkrn
 9gVnLeDn7TtIHopCEcAuDFVduiV5bkQQ4NeMDkzRyGOyjrUCQ02FS7AG9jmmMZC0cViU
 IpUU+N16vGXTqz4dncqmT5xs/j+RHxEFyUrp58UV1C7C4LimJxw05oCCW1d2/0qFbXvc
 IKyGUZv09MHu+oVrZACbW/1pMMTCqowFurUmHHLuKrSUPT0Do34oSRwZfRM3XhmnwPIc
 28/Fl4+fATYjvMqhcYMyUEeTVZRKJF1ojrVAenVciq55M1c0BFn5gnHuuaThqyw6/Q0N
 3ojw==
X-Gm-Message-State: AOAM532Bc0wefsrefizOwtZFzxN6rXjmmvs4d5FY2h7kJEhK1AlW9PeR
 DGVSj3ShIIYK0owD22INfP4X/JlcyW5Jl9VXTnGvZQ==
X-Google-Smtp-Source: ABdhPJyQEYq/aa0gjJEO9Tga4REDnt5I6yrfTmBRW4eRCznjlBUHHMh0lYM73RO7oxgtpMzyqDMXDoNaOp6yMHVijEk=
X-Received: by 2002:a05:620a:170a:b0:67d:be5c:204a with SMTP id
 az10-20020a05620a170a00b0067dbe5c204amr5211992qkb.593.1647285955193; Mon, 14
 Mar 2022 12:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <1647269217-14064-1-git-send-email-quic_vpolimer@quicinc.com>
 <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1647269217-14064-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 14 Mar 2022 22:25:44 +0300
Message-ID: <CAA8EJpr2rw4eSA+PViW7UZ2rVLLDS+ipcuo-1dzOargTcbE2hA@mail.gmail.com>
To: Vinod Polimera <quic_vpolimer@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v6 1/5] drm/msm/disp/dpu1: set mdp clk to
 the maximum frequency in opp table during probe
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, robdclark@gmail.com,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Mon, 14 Mar 2022 at 17:47, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> use max clock during probe/bind sequence from the opp table.
> The clock will be scaled down when framework sends an update.
>
> Fixes: 25fdd5933("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index e29796c..9c346ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1202,7 +1202,9 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct drm_device *ddev = priv->dev;
>         struct dpu_kms *dpu_kms;
> +       struct dev_pm_opp *opp;
>         int ret = 0;
> +       unsigned long max_freq = ULONG_MAX;
>
>         dpu_kms = devm_kzalloc(&pdev->dev, sizeof(*dpu_kms), GFP_KERNEL);
>         if (!dpu_kms)
> @@ -1225,6 +1227,12 @@ static int dpu_bind(struct device *dev, struct device *master, void *data)
>         }
>         dpu_kms->num_clocks = ret;
>
> +       opp = dev_pm_opp_find_freq_floor(dev, &max_freq);
> +       if (!IS_ERR(opp))
> +               dev_pm_opp_put(opp);
> +
> +       dev_pm_opp_set_rate(dev, max_freq);
> +
>         platform_set_drvdata(pdev, dpu_kms);
>
>         ret = msm_kms_init(&dpu_kms->base, &kms_funcs);
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
