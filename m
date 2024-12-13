Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8439F0D4D
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 14:31:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709F410F002;
	Fri, 13 Dec 2024 13:31:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SjbPXjBA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05C510F002
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 13:31:37 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-6f00b10bc1dso15976567b3.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 05:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734096697; x=1734701497; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sfJqbpO8fzR7hotkw8WChASKcoelnmQh7lFNBgHegyc=;
 b=SjbPXjBAfxC9XY2jwgeLrAyIA5O0Uj2AvVE+grzHIH0WR9fvBJYZf6bouispY9x8Tz
 liQhIQCaCxsrjkrAMR7Ofnqt15CBAD4Cd2wjux5XYjRSS8aPX1jusisOndw64BEUgNQT
 uWghjwaUWOVkxV3TzrKtCtbO9YTunkwSpuFrI3XPDTnc/xVl5i/2JGmhLpiFgPqDDFnp
 6QIbsxrc3h+nRGVD3Fjn87kRyFc+P6FTPhfsIQm9MdX0ySEOXAZ+5AiZgJfgH88Djc+d
 BVR1KtlVl0ChBgAIa58fqOupqZ/nKCII1/CVed3iACA9Iw8vgHW0JMbSY+WZqKG/oUYB
 yKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734096697; x=1734701497;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sfJqbpO8fzR7hotkw8WChASKcoelnmQh7lFNBgHegyc=;
 b=FOfY9f+j3w+zZ6TyJD0ygSNs4+GQDFivnYZQQWEppDJ+meG1RsYUbpUeX7BT1GXwvt
 0ekDZG/X1I8iNMhQSRtZPJABlQzF2143N69FTs8CGNkJKZOmBvWz6P1HJo5vD+0/riZo
 /2XI4FcC6ttFP06fNZjXPsurwoF4PWuKCNM244ljF0e70jT3DIJCALR9zEeZUtpHz4Sm
 SA8ayCoTj793/hmnOYe7trAKZNocE9UT+mUGrTlS2+IyL7DmtCIMu/wgBz3OGrJda9SA
 MEu8u6zj45x04bEFwjr+UgD6PboxIvoBDmKSdiKCqPat0X/rTc9TcYhZgXG3JTpoKvoe
 9YcQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2NS0Oxv6J59XTej470addC/imXnraIYfYwsYSI+4LOB7vg2AnZ+XPvGK4QWzHthSQtN70vj417I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzvt6OwwqfJQD+/pyHjnz//ObJwn65OOwKjCSQ3Fv7fMSYkxfFE
 QLWjQjPjfH8pALyMKwXIOy0hVUV3MGwWNDsAQ0BQQyqh3OaexM/QrzT6861OmkclaUZnZFcAoOl
 t5Fvh+7PKfrDOZUGP2lRzwNof/9qtgK5H0e94RA==
X-Gm-Gg: ASbGncvGFA3i0hVkNKersHU+qGyEaFRF5BKaur/MAoDLSfDs+X0HEJop8CgPurLUEqD
 /nfEYb1C13LsUvmd4PG037pyOZZ1b67DSfM2I
X-Google-Smtp-Source: AGHT+IG2oQo9/pJojNxPge9b6BLy5vw+9wYfAvJ7mQMiGJU6v/4xK8PvgaXtkMMl3WrEhcVUtJlFxa3Ns2fJC50KKas=
X-Received: by 2002:a05:690c:6e13:b0:6ef:7fdb:7d41 with SMTP id
 00721157ae682-6f2798e0c42mr25633727b3.0.1734096696819; Fri, 13 Dec 2024
 05:31:36 -0800 (PST)
MIME-Version: 1.0
References: <20241213-qcs615-gpu-dt-v2-0-47f3b312b178@quicinc.com>
 <20241213-qcs615-gpu-dt-v2-4-47f3b312b178@quicinc.com>
In-Reply-To: <20241213-qcs615-gpu-dt-v2-4-47f3b312b178@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 13 Dec 2024 15:31:25 +0200
Message-ID: <CAA8EJpom2amWzH5QpXrPSdMKS6bB_8O4CU67OVNuEjkjA-wseA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 4/4] arm64: dts: qcom: qcs615-ride: Enable
 Adreno 612 GPU
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jie Zhang <quic_jiezh@quicinc.com>
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

On Fri, 13 Dec 2024 at 13:32, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> From: Jie Zhang <quic_jiezh@quicinc.com>
>
> Enable GPU for qcs615-ride platform and provide path for zap
> shader.
>
> Signed-off-by: Jie Zhang <quic_jiezh@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index ee6cab3924a6d71f29934a8debba3a832882abdd..860a0db1908cfe32a250b14aac14065923c5a575 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -202,6 +202,14 @@ &gcc {
>                  <&sleep_clk>;
>  };
>
> +&gpu {
> +       status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +       firmware-name = "qcom/qcs615/a612_zap.mbn";

This brings up my usual question: should it be qcom/qcs615 (fine with
me) or qcom/sm6150 (maybe even better?)

> +};
> +
>  &qupv3_id_0 {
>         status = "okay";
>  };
>
> --
> 2.45.2
>


-- 
With best wishes
Dmitry
