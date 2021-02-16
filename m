Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D32231D1E6
	for <lists+freedreno@lfdr.de>; Tue, 16 Feb 2021 22:16:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA28F6E993;
	Tue, 16 Feb 2021 21:16:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96386E993
 for <freedreno@lists.freedesktop.org>; Tue, 16 Feb 2021 21:16:11 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id t63so10900166qkc.1
 for <freedreno@lists.freedesktop.org>; Tue, 16 Feb 2021 13:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4rk2wwMnoEYPma2xWk6NuZcb3jVPhgKDLBkofVU2y60=;
 b=R+8pOfYFLSejFXP4jPbZWyn2LCtTqjsa107yazeTQYzIiH+LeuXV8YusgV1w2LW7Gj
 IWuN/sQJoxWt9kjU2m1A0IEY/6wlvACZVnyqcaPH2km5k9LUt8ts3M4OHj1XvYTTZZkW
 rjW38aeg7HxP9QhTVv54x2qt3u/WscEX2iM4yrYjSBhupKyYIaqkdMFpaqnoJFYmXprV
 I1zgweu48q+ye18tY0/BN4DBJsh6ih3x8VrOP9uPC0i1KXV2RJOFuixu9mdTmoQ7YBIn
 GrOIyR0KjHr0uLL9E/aZBqPOXAQgTx/K0/q/9ZXIgZ1bQe7IAfzyHzIn4DlXmhcrZm82
 xH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4rk2wwMnoEYPma2xWk6NuZcb3jVPhgKDLBkofVU2y60=;
 b=R8p1iaEEe8ccF2jRE0WoqLWs0LvADevXFMAbtVu6INXd/orI4JP9tiVrxhyuOrQmLN
 ai0nq/BplFBZ4aXTMGh3tVNPbfJPfAO7zVlfQSdSRxKzQNB6A9DbsYJRn+o5OyAW99Zk
 W68aPJTcuKYaJhB3ndtIco1Jj/XPIGBkU3+GcGtXIh8HnYoZ/gpdGG0aLnjizO3w/P/W
 KiE1p9Ao6XOMr7TmvOa3toFLRHrXjKUHAYNeubpxYwk8l5krX/H1l2q5l9DEiou5uRzS
 FetCzp+CCXHLOhcu3bgHh0eOzYrVnpjZtTtXDdHf/1VzLKlapappCD57e02cS7MMXdka
 WQWQ==
X-Gm-Message-State: AOAM531Y/CE3CV2oJnTpmaBbmZk5aTc4zXKy7yeaiQt2G/qr79lQp7Sl
 uUH7RsA750Tgs0E76GNlMGFo+3QZNK7z1UFHSCFPMw==
X-Google-Smtp-Source: ABdhPJw7adO/lfGbSQKSW3fwASRPbVhGElhbv5piVyBRNIk/XQd9cjcJFShG12gleW/Aq/SWUeiZazbBtAYlBzPhYXo=
X-Received: by 2002:a37:a9d6:: with SMTP id
 s205mr22217992qke.162.1613510170667; 
 Tue, 16 Feb 2021 13:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20210215161537.14696-1-jonathan@marek.ca>
 <20210215161537.14696-2-jonathan@marek.ca>
 <CAA8EJpo_Fs8Wj6zjH6BQqm=mG=qcGt3_JMj4nK-vsKCzr8tn1g@mail.gmail.com>
 <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
In-Reply-To: <29231c68-0cc4-9d8a-8cb1-791511780bcd@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Feb 2021 00:15:59 +0300
Message-ID: <CAA8EJpq27u54eusDEgkLBfkWd0Cp+rQq6Jh-LOYYG3CXM2U3Gw@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Subject: Re: [Freedreno] [PATCH v2 1/2] drm/msm: add compatibles for
 sm8150/sm8250 display
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
Cc: "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jcrouse@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 tongtiangen <tongtiangen@huawei.com>, Qinglang Miao <miaoqinglang@huawei.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 16 Feb 2021 at 21:06, Jonathan Marek <jonathan@marek.ca> wrote:
>
> On 2/16/21 11:54 AM, Dmitry Baryshkov wrote:
> > On Mon, 15 Feb 2021 at 19:25, Jonathan Marek <jonathan@marek.ca> wrote:
> >>
> >> The driver already has support for sm8150/sm8250, but the compatibles were
> >> never added.
> >>
> >> Also inverse the non-mdp4 condition in add_display_components() to avoid
> >> having to check every new compatible in the condition.
> >>
> >> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >> ---
> >>   Documentation/devicetree/bindings/display/msm/dpu.txt | 4 ++--
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c               | 2 ++
> >>   drivers/gpu/drm/msm/msm_drv.c                         | 6 +++---
> >>   3 files changed, 7 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/msm/dpu.txt b/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> index 551ae26f60da..5763f43200a0 100644
> >> --- a/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> +++ b/Documentation/devicetree/bindings/display/msm/dpu.txt
> >> @@ -8,7 +8,7 @@ The DPU display controller is found in SDM845 SoC.
> >>
> >>   MDSS:
> >>   Required properties:
> >> -- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss"
> >> +- compatible:  "qcom,sdm845-mdss", "qcom,sc7180-mdss", "qcom,sm8150-mdss", "qcom,sm8250-mdss"
> >>   - reg: physical base address and length of contoller's registers.
> >>   - reg-names: register region names. The following region is required:
> >>     * "mdss"
> >> @@ -41,7 +41,7 @@ Optional properties:
> >>
> >>   MDP:
> >>   Required properties:
> >> -- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu"
> >> +- compatible: "qcom,sdm845-dpu", "qcom,sc7180-dpu", "qcom,sm8150-dpu", "qcom,sm8250-dpu"
> >>   - reg: physical base address and length of controller's registers.
> >>   - reg-names : register region names. The following region is required:
> >>     * "mdp"
> >
> > These two chunks should probably go to the separate patch 'dt-bindings:...'.
> >
>
> In this case I think its better to have this change in the same patch,
> but maybe one of the Robs will disagree.
>
> > Also, could you please pinpoint the reason for adding more
> > compatibility strings, while they map to the same internal data?
> > I think we might want instead to use some generic name for the dpu
> > block, like "qcom,dpu" or "qcom,mdp-dpu" instead of specifying the
> > platform name.
> >
>
> sdm845 and sc7180 aren't using generic compatibles, this is just being
> consistent with that.

Well, I suppose the common case is to use the 'first compatible' entry
if the entities are compatible. The generic compatibles is a proposal,
not an affirmation. Please excuse me if it sounded in a different way.

>
> >
> >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> index 5a8e3e1fc48c..fff12a4c8bfc 100644
> >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> >> @@ -1219,6 +1219,8 @@ static const struct dev_pm_ops dpu_pm_ops = {
> >>   static const struct of_device_id dpu_dt_match[] = {
> >>          { .compatible = "qcom,sdm845-dpu", },
> >>          { .compatible = "qcom,sc7180-dpu", },
> >> +       { .compatible = "qcom,sm8150-dpu", },
> >> +       { .compatible = "qcom,sm8250-dpu", },
> >>          {}
> >>   };
> >>   MODULE_DEVICE_TABLE(of, dpu_dt_match);
> >> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> >> index 94525ac76d4e..928f13d4bfbc 100644
> >> --- a/drivers/gpu/drm/msm/msm_drv.c
> >> +++ b/drivers/gpu/drm/msm/msm_drv.c
> >> @@ -1185,9 +1185,7 @@ static int add_display_components(struct device *dev,
> >>           * Populate the children devices, find the MDP5/DPU node, and then add
> >>           * the interfaces to our components list.
> >>           */
> >> -       if (of_device_is_compatible(dev->of_node, "qcom,mdss") ||
> >> -           of_device_is_compatible(dev->of_node, "qcom,sdm845-mdss") ||
> >> -           of_device_is_compatible(dev->of_node, "qcom,sc7180-mdss")) {
> >> +       if (!of_device_is_compatible(dev->of_node, "qcom,mdp4")) {
> >>                  ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
> >>                  if (ret) {
> >>                          DRM_DEV_ERROR(dev, "failed to populate children devices\n");
> >> @@ -1320,6 +1318,8 @@ static const struct of_device_id dt_match[] = {
> >>          { .compatible = "qcom,mdss", .data = (void *)KMS_MDP5 },
> >>          { .compatible = "qcom,sdm845-mdss", .data = (void *)KMS_DPU },
> >>          { .compatible = "qcom,sc7180-mdss", .data = (void *)KMS_DPU },
> >> +       { .compatible = "qcom,sm8150-mdss", .data = (void *)KMS_DPU },
> >> +       { .compatible = "qcom,sm8250-mdss", .data = (void *)KMS_DPU },
> >>          {}
> >>   };
> >>   MODULE_DEVICE_TABLE(of, dt_match);
> >> --
> >> 2.26.1
> >>
> >
> >



-- 
With best wishes
Dmitry
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
