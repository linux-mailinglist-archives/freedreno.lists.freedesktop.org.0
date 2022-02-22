Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D49F4BEFC5
	for <lists+freedreno@lfdr.de>; Tue, 22 Feb 2022 04:12:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B0610E5C6;
	Tue, 22 Feb 2022 03:12:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4080B10E5C4
 for <freedreno@lists.freedesktop.org>; Tue, 22 Feb 2022 03:12:05 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id a19so37624516qvm.4
 for <freedreno@lists.freedesktop.org>; Mon, 21 Feb 2022 19:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qFJMqR0Uyd2kPZ5TICCuCWl+NAqTGxv/k2Ys7IDjf1s=;
 b=eyN6+87FrkdQPVOr02hchsIoth9vEfXRogzh61Xd1oI5aXdVT2uFWCEPPJYTrRv/Oq
 VCXMlqOIk0eiOge3ouDVg2be5IvzO2TyduP2cS0nh9yWZttszDJZi6DFD3FF6ziAIufA
 NygeTb8+dUkED6jzSHG85PAHSaXfRwqG1s/I7LyzCJbCtP/Aobb08J9aGGLTYB7QEmLM
 JdIIRgC58FkZtiXfZ07Cl92oz2NQvr2rct3+QCxxbEG2JUZkZgx5EeeaLOHw6rbKBbcp
 7ZF2OoukMgUCAkU6dyrbi04NWD/T1lz6Wt7AE3oDyjdLdd3MvkPV6Ig9D4LpPcy6s5iW
 sIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qFJMqR0Uyd2kPZ5TICCuCWl+NAqTGxv/k2Ys7IDjf1s=;
 b=yGHB6e+SHXpTWcdMw2TDoh2sgtgv4eRtYrMmuryQTk+n+FJRQRKAZknkcBNXV1Sc91
 KNDzMJBfhjViqUvgfnzGzwA1vYc6XOGwRKNVNLJ4SEt9Lo1XPmVbB4B7h8RsKeI8/fn1
 dOahiw1ifp26xy/cIbp5vcMluX2iJeszPi/h5JzQvRllbgKQ/BvsR4e//ZyZGTkKUsmg
 NI8ml+bAP/j8l6cauJuxsNNx8k4YBros22+uQY1a0yYnbevDTK11apgPRXYgnb0MAyYZ
 jsO4zF719nlZAbNAGEVN9VkgOfosES9C4WdvdCkF9JOf7XIjN7PAM3xHtnL9O6Zi2BUi
 S2wA==
X-Gm-Message-State: AOAM5317o5X86MJfQZoYdowafQusVovXpsFC0pKoOTOPrlBVUlKwe/j2
 bKuxBPFmVYpniamCemJXEYOmLykSb44Z+Q83RSei8g==
X-Google-Smtp-Source: ABdhPJzuBSQDu4totjZ87w+DOzd95iK77ndN1yjJvntgthnFEFwtdZKse38DWkEDhFKlI/9NC/pR/5/P6bLR2axIZn4=
X-Received: by 2002:ac8:5b88:0:b0:2de:23e3:62c0 with SMTP id
 a8-20020ac85b88000000b002de23e362c0mr7377707qta.62.1645499524196; Mon, 21 Feb
 2022 19:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20220222012638.6650-1-konrad.dybcio@somainline.org>
In-Reply-To: <20220222012638.6650-1-konrad.dybcio@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 22 Feb 2022 05:26:03 +0300
Message-ID: <CAA8EJppM=3R-h0Yai4JTSfc3j-nvV_oCgK+t5Vz_8X6A_AfO=Q@mail.gmail.com>
To: Konrad Dybcio <konrad.dybcio@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [RFC PATCH] drm/msm/dpu1: Add a common DPU1
 compatible
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, jamipkettunen@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Yangtao Li <tiny.windzz@gmail.com>,
 Rob Clark <robdclark@gmail.com>, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 angelogioacchino.delregno@somainline.org, marijn.suijten@somainline.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Tue, 22 Feb 2022 at 04:26, Konrad Dybcio
<konrad.dybcio@somainline.org> wrote:
>
> There is *almost no reason* to keep separate compatibles for different
> SoCs utilizing the DPU1 driver, as it checks the HW version at runtime.
>
> Introduce a common compatible, while not removing the old ones to keep
> old DT compatibility.

I don't quite like this idea. Specifying more or less exact
compatibility string gives us more flexibility.
Few recent usecases to mention:
- qcom,mdp5 compatibility. If we had soc-specific compatibilities, we
would be able to switch the drivers w/o changing the dts. With a
single compatibility we would have to change the dts if we were to
change one of the boards form mdp5 to dpu1.
- qcom,mdss-dsi-ctrl vs qcm2290. We have to add special compat string
to account for the different io addresses. If we were using
soc-specific compats, it would be one from many, not one vs many
usage.

>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
> ---
> Bar some very very very unlikely edge cases (such as need for some random
> quick being applied to one SoC from a family that shares DPU hw rev, but
> not the others, there is little to no reason to keep adding compatibles
> that don't mean anything.
>
> If this change is cool, then the question about what to do with
> dt-bindings arises...
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 47fe11a84a77..335018542a3a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1348,6 +1348,9 @@ static const struct dev_pm_ops dpu_pm_ops = {
>  };
>
>  const struct of_device_id dpu_dt_match[] = {
> +       { .compatible = "qcom,dpu1" },
> +
> +       /* Legacy compatibles for old DTs */
>         { .compatible = "qcom,sdm845-dpu", },
>         { .compatible = "qcom,sc7180-dpu", },
>         { .compatible = "qcom,sc7280-dpu", },
> --
> 2.35.1
>


-- 
With best wishes
Dmitry
