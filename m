Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD59576F92
	for <lists+freedreno@lfdr.de>; Sat, 16 Jul 2022 17:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5E18AC4E;
	Sat, 16 Jul 2022 15:00:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0778ABC0
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 15:00:49 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 k8-20020a9d4b88000000b0061c7f8c4f77so4677201otf.10
 for <freedreno@lists.freedesktop.org>; Sat, 16 Jul 2022 08:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=OCzu8o65jRXe8kPCqql1dkNy/KOHUusXq9Qq20UZz6c=;
 b=jByed41fI6hFQz2xdF/cZBTRCTWtuNRpqfrzM4D+IZWUez7IXqMrYxyVT2I8UjNexH
 zodo3jqlUMaE/1Zk96unWmzq35cPuROjwHnFo8pNHCmlCr5P5lOz2HMAiiVztod4gA5z
 3mnF/oK0KHg2toiZoqdO6yJHd3TJSW+q8o6PGAgoSGS0rhqFz3IyxagddxIbGb8MSZcx
 Zo7z3EhOewZTZZ4ZLi5fUO5D6BpDPsXyLFPdLfi9o3pepa5WM6YWRaJef/N5UMx+KhCp
 U+kXGkV9/4Dnp8fpeVMUmYuPH7mlQ9Xv9Bnqk2Cw1L3nscgk6F56I57tD4xPMRw0Bf9d
 Y+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=OCzu8o65jRXe8kPCqql1dkNy/KOHUusXq9Qq20UZz6c=;
 b=VAOP0KCr1T81a+QAqkk/AdQiGTKg4wfZZNeeeuBLCKC/LLEaFYrL28LT3kquaE7WRM
 QewtvJ33BeauAN6h5ZxEL4G6fSJS2KHQkTUa3YT3dlkNRlAyVFQriSOhhD7FCIfwXr0f
 tLVHFjzBq56lYAO9vyseBVm+Zr57wsLxvi9dTKGvhF+8qTCZukTu19zLMPyimkiv0faD
 h1LkwcXyvon4oLayPE1a9kvHo1fJdMTJXuCzXYo4cHHIJ+7YD/1BAM1jrt0gHO/C6ULk
 O15fhIqatiiQObNQ00JaSIFRnvybv92+u6C6oxUI25CmtG8QbBreD12Vg/wiHZMRh87f
 Skog==
X-Gm-Message-State: AJIora8lv1vANxPQbUE+SR0QWpfzOsv42iHoqvDxnNATyzdk6DrFDlzU
 Sv2b9EA1Lu5bAeoAzUABT3W3rQ==
X-Google-Smtp-Source: AGRyM1svToWbvX0jHGW2fdza8Lv63PzW2QBjLT84JxmK5lubx1xwBrqWz5tlH1ij8hv06lzx3HJqbA==
X-Received: by 2002:a9d:6443:0:b0:61c:7f6b:fef8 with SMTP id
 m3-20020a9d6443000000b0061c7f6bfef8mr4573896otl.319.1657983648466; 
 Sat, 16 Jul 2022 08:00:48 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 d8-20020a9d51c8000000b0061c7ce09091sm2684336oth.67.2022.07.16.08.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 08:00:47 -0700 (PDT)
Date: Sat, 16 Jul 2022 10:00:46 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <YtLSnj9UjLBBZGFK@builder.lan>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-2-dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 1/9] arm64: dts: qcom: sc7180: split
 register block for DP controller
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Sun 10 Jul 03:41 CDT 2022, Dmitry Baryshkov wrote:

> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 47ce5787ed5b..875808cf0614 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -3080,7 +3080,11 @@ mdss_dp: displayport-controller@ae90000 {
>  				compatible = "qcom,sc7180-dp";
>  				status = "disabled";
>  
> -				reg = <0 0x0ae90000 0 0x1400>;
> +				reg = <0 0xae90000 0 0x200>,
> +				      <0 0xae90200 0 0x200>,
> +				      <0 0xae90400 0 0xc00>,
> +				      <0 0xae91000 0 0x400>,
> +				      <0 0xae91400 0 0x400>;
>  
>  				interrupt-parent = <&mdss>;
>  				interrupts = <12>;
> -- 
> 2.35.1
> 
