Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D75A34B19
	for <lists+freedreno@lfdr.de>; Thu, 13 Feb 2025 18:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E90B10EB42;
	Thu, 13 Feb 2025 17:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Im3QxvqP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA810EB42
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 17:00:41 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-308dfea77e4so12573461fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Feb 2025 09:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739466040; x=1740070840; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8UZNM2cfJDvWcZt1Er+PnBNRIi/F3g3nkljefPZmTuQ=;
 b=Im3QxvqPGG1YHvvK076x2e8t9JjOVilLkdUQY0olqJkOr2YY6MFPa0M8meqhrj3JrH
 Iysd6TQKDsXK3lBDPoercQsUnY8vLQXbpAYTQNB7jvYonwUPLncawzHWfRsIrvtLb2Ho
 TV+NQ5wWmyPujnDZXPFyPmt+SjKNFA2pjHi82Y9z/zg1ugFPZHNvXBLdSAcKFxYP1tWB
 /Akxb9TJrIgU9b594gf6JXnjICI30IXDCpCwJm8lLXkxyT/OkfrsDL1cqg1bPwC4O5oL
 ABxC4+YqwV/QlEzM+Lwfa8iDx8/D6+mjdInj/GKzWL48PGphbYcQql8VVTkwlOxs32vq
 ZPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739466040; x=1740070840;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8UZNM2cfJDvWcZt1Er+PnBNRIi/F3g3nkljefPZmTuQ=;
 b=HQWbVVDh/5Ynsx2QKGhhpaJ6XlYt2xtBaMRVz3RmsRaeCTXrKcbq4qmcewaZtzRnT1
 CJajc4jUgIn6QbKKcoYyn7Ty8NMIOr+RFC+RIBmNkbkJ1dwn1Jirq0q1ZpfTg00IwILZ
 e/t4U9Nev7ljxRO6GT87rZpfWxTbmcuKwL9OCfNEDMSz3U3dB1W8gmuc7OG1rcnc8sR2
 HjvcgN5JBJjpeCtItHnpyJu6JlYKQu1/VHeJQHNZgl9SBwdNT/D2CTZC6SuSe6IIfNL8
 0GoWX0aGmjdFnnK6k3tW6k24W5FwVhjzv2jxe4ijeGgNdJYSiAu8eaetLbwpez6Pmewc
 K5EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUS0F3ZX+i++e7BAsH4Eu8m1mY0uGPSjyejQAhecP3Ml51NL5/rjXUrJ1NXIEyAqNjYbmfTyLWDE4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj9I645GEVgqxB6C17uYKRgykDoNlyGE8cZwWv1af1u9niLiEe
 PhSjBzidkdcLKDTXc9DFm+s0ELOk4pLb3OoYx4r7RsPVBmNKaYeEDnNGOpDZKNo=
X-Gm-Gg: ASbGncv7hDojaFl1A27kdXgV67FkBEj1ru0agBaqSyGE2/7N1QnDytTIr/wKbi0LDBT
 eRlD/mrfZ1CJdJzUV6jgw11YqF/scjLxU1kKNb9wk4Mm0GOhqDIp9V0Yt3hL8zQYqcB2icUV6LJ
 dvB78cvHWimxEtKAvKaTGI5AIeaGaLApggyRo8tsI348s4Q+7wcT6NaQoMocTQnygtKulCbS9Iu
 Ml9N0HGOpeNwZT1js2PiM0dnNXB510VikIck8VNi0R5x+Uyqe7m5deIfP5+LnbbAXgyiKP2vNdq
 IeG0OfUTfDxpHv+rde7tknPdjQ4rLHfX5G8zwjITfFDsml/Dk6DH8WbrqaMuDgp90XdRfoE=
X-Google-Smtp-Source: AGHT+IFxfLzjVADe+NQ9hyecFQjlri4ibXGiH0NU1miK6ClkLcEickWMwRLitIzMvkrGViP4aYFupQ==
X-Received: by 2002:a2e:8887:0:b0:300:17a3:7af9 with SMTP id
 38308e7fff4ca-3090f3bee24mr11613931fa.19.1739466039832; 
 Thu, 13 Feb 2025 09:00:39 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3091029b835sm2457111fa.100.2025.02.13.09.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 09:00:38 -0800 (PST)
Date: Thu, 13 Feb 2025 19:00:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: sm8650: add missing cpu-cfg
 interconnect path in the mdss node
Message-ID: <7mojw3jf5skm4esa3xquthkpwez52u5fnbvyqj7g7hdjgsz5dz@ewfsb36sa7tx>
References: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-0-3fa0bc42dd38@linaro.org>
 <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213-topic-sm8x50-mdss-interconnect-bindings-fix-v4-4-3fa0bc42dd38@linaro.org>
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

On Thu, Feb 13, 2025 at 05:27:59PM +0100, Neil Armstrong wrote:
> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
> add the missing cpu-cfg path to fix the dtbs check error.

Same comment. Nevertheless

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> Fixes: 9fa33cbca3d2 ("arm64: dts: qcom: sm8650: correct MDSS interconnects")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

-- 
With best wishes
Dmitry
