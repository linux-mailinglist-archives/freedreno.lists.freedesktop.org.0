Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0D7570E4A
	for <lists+freedreno@lfdr.de>; Tue, 12 Jul 2022 01:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B976F11A8AD;
	Mon, 11 Jul 2022 23:28:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507B4113D72
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 23:28:01 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id ss3so5367789ejc.11
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tT3i3PdSWIbZI2/jQXTr2ht9FWXt0v5w3WnrwY7zOxE=;
 b=Ldn5e/XdivqNGq4Wo2DSw9vOq5ICFZFMjEsGK5qXKUBqT+RZBBTBUQUrgowVxl9abf
 IZvV6AFjiDL62G8G5+bfNOR9kg81XWRLWcfzrZg1n3q+TAcpqNtW0Qm6u4XsGNXO02KB
 w0cKuHUwdeLDMcYS59ah5rxS1gcxsji/tG4DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tT3i3PdSWIbZI2/jQXTr2ht9FWXt0v5w3WnrwY7zOxE=;
 b=S6GEeC2r+OkWmL6T1vMVFbnbgRC6S0Lb3V69QayfQXyt6YRAOjhjPVh9oEK8ejChek
 bVvbSziAAx5z31elFyCZcoZzedgLx99hgYPYR2iyB+QEVYwRQmpdxH1YLYQmkQHWhWhu
 F67BhmBN/Q8vNgqvZIq2iUyGLNTDRu6vq1P85bPeyYJTRoZaphKHx0t6iBjorcvUqlEh
 eZjUrtdo9/v7eRbVmut0UUGZO5k4C/NS8Ogh0C/VICZ7aKj6um2fdMZkQBr5EF5FaRSl
 mf6KrOX3MYzDTUV8LP0eYhaq2uMGIm6sZM+cywn6ahJVRdCN1rnheAh3WIuix5NgnUft
 EQYw==
X-Gm-Message-State: AJIora+FXA7OHgDJIssQXmvgO9kAPlSexWKFBfHW/benuxfkqPF8E2Hy
 yofrSlyhhAXihSakASbhW/I8GCUARGrqFSzQXRc=
X-Google-Smtp-Source: AGRyM1vWRdC8OKNhrUjgrydWPvbQzkArFJ3rcOFpWE7D3W3zjPxmiZh7vjK+nBfY2d2no+ssP5gARw==
X-Received: by 2002:a17:906:284c:b0:727:3773:1a53 with SMTP id
 s12-20020a170906284c00b0072737731a53mr20367601ejc.765.1657582079520; 
 Mon, 11 Jul 2022 16:27:59 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com.
 [209.85.128.42]) by smtp.gmail.com with ESMTPSA id
 lb17-20020a170907785100b0072a430d2abdsm3161750ejc.91.2022.07.11.16.27.57
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jul 2022 16:27:58 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id l68so3814061wml.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jul 2022 16:27:57 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:3a2:e97b:f3ae with SMTP id
 bi21-20020a05600c3d9500b003a2e97bf3aemr728744wmb.188.1657582077548; Mon, 11
 Jul 2022 16:27:57 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
In-Reply-To: <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 11 Jul 2022 16:27:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
Message-ID: <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu
 register list
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Matthias Kaehlcke <mka@chromium.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On Fri, Jul 8, 2022 at 11:00 PM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Update gpu register array with gpucc memory region.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>
> (no changes since v1)
>
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index e66fc67..defdb25 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -2228,10 +2228,12 @@
>                         compatible = "qcom,adreno-635.0", "qcom,adreno";
>                         reg = <0 0x03d00000 0 0x40000>,
>                               <0 0x03d9e000 0 0x1000>,
> -                             <0 0x03d61000 0 0x800>;
> +                             <0 0x03d61000 0 0x800>,
> +                             <0 0x03d90000 0 0x2000>;
>                         reg-names = "kgsl_3d0_reg_memory",
>                                     "cx_mem",
> -                                   "cx_dbgc";
> +                                   "cx_dbgc",
> +                                   "gpucc";

This doesn't seem right. Shouldn't you be coordinating with the
existing gpucc instead of reaching into its registers?

-Doug
