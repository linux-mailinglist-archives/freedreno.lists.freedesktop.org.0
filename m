Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4801DBF7020
	for <lists+freedreno@lfdr.de>; Tue, 21 Oct 2025 16:16:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC8CB10E605;
	Tue, 21 Oct 2025 14:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="W8axM6ij";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5865410E605
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 14:16:51 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-46b303f755aso60340105e9.1
 for <freedreno@lists.freedesktop.org>; Tue, 21 Oct 2025 07:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761056210; x=1761661010; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=GH+Au8Z65JXGAtAPh2UGeuug8ILOECULe8PKQvQu4p0=;
 b=W8axM6ijTrmfT0GLYuCOMUl7U4PuTQ2x2QfwVez0U1npuDMzsNd77YxR80RUuwdi7h
 4O1XGkOto8Rz1trQXAweN6ddA5Jot41Yy1X1p1DqxF2Y83Bj0QN8w4HULOcJYsUw9Tc6
 2GuM9ceZMBccjqq7dHqxqOEUifZ5HDzrskl3sEbsxQx9H0z0gAlckngGn9Ap5YAOW/24
 FZbH257zmFpfgjEZetcwyssSPLKeR0oOI42hQ/Dnzedwa4CfuF2OzTxsMI+DC4ZZyAGL
 dUlLDYonjFQll/qXe+fQJ+OiawC+NlwMIlIHNgyICQr+e6SR3UQ0TMCOJiES1m7EJMdW
 oW3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761056210; x=1761661010;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GH+Au8Z65JXGAtAPh2UGeuug8ILOECULe8PKQvQu4p0=;
 b=HvIuQJGPXcnIAGCRULjXh2uAK01yQm/MlsAY3k1xzyVPSJou0eFkgKzlSTVlZik9jq
 EPYnavlR1m5jjerMR9fcJ5avfoq7lgb4S0mZByDeqq8fsF3jtN7Py+nivarTbo55UzdW
 IDR0kriCtd16iCZ74ID6R/CrxBg6yin+8FEGoSCoq4rY6QYnQiFlMU632YUx4LxAr772
 JB3aOb/Kqc8md0+L5wYGf1VRA3VfJQN2jigaF0g5LKdeaWoalad+BWCTRINQULfv4Jj5
 at17cbsss1Jz+m0vB0TSsoOlCZmAB5Ily3a7M+5KimqTwvyna7cX70Odf3gtjyw6I9At
 hr2g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDkBH/mRmPirtcjhIwuycsuL2/yN9lDjh5M4FyxzXxc4tpIl13hz0E8u2lCEvT2Xj7PyN7ftKVT7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA264xOzW9Pm29ySL0hAIo9IIE/qI0T9Du0pTvnLjxF+tKU1BG
 FuunbBiPsH1w3NNImoYGx6pBqeov2Wl4OLm6aLbcosntfvfS3op1VBq0mBgWAw6j6Fw=
X-Gm-Gg: ASbGncuS04LpAUPx09S3b1ztpDDax4gTMi2/h9oGTLfn+k0dhREeS5ZYGmzSEvg9yRE
 bjKGaNkqZSgACHluAO+8ci1Y7SbRXV1S1w1t52DkIRD8wXT+1V4ArOax25Uo8rQr0b8srIAT/Cu
 4q+iORKG04xJ5zUlpcGvNFow69w4YW/P33HH/mjwX+dxnAE7o2RtB/fcpodDDaVM2k3v06oLse8
 228DZpTq694aXySs4CTbmmJfr/EcjsxKWHlMxTqjGOWdGHj0Yi7P0NPV5fNSL1QRObsRA6/45jH
 8LX5lmdyk6NOvoX5mXU5JHBkbkczwZ3lKupjH7IdchCA9j7HSLBg1+hG2n0a/erNRXCwgez1YIH
 M7d73qhZRaeh48rQtzkKF2m/h1z+0yCpWcA36C+KSgaPl2WTRU90ZGeOJe6Oug9obb9d/xsME
X-Google-Smtp-Source: AGHT+IGlCzAGBWO2jDwO8KOdW9RPFbusOV38zy/UqpC4nz4HnuMn3sNj6s9XMr9He0B2eairZT1Tyw==
X-Received: by 2002:a05:600c:818d:b0:46e:394b:49b7 with SMTP id
 5b1f17b1804b1-4711791fed6mr135325295e9.37.1761056209687; 
 Tue, 21 Oct 2025 07:16:49 -0700 (PDT)
Received: from linaro.org ([86.121.7.169]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427f009a9a9sm21138244f8f.29.2025.10.21.07.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 07:16:48 -0700 (PDT)
Date: Tue, 21 Oct 2025 17:16:46 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: x1e78100-t14s: Add audio playback
 over DisplayPort
Message-ID: <honsqyec45rg4yrh3rwjlqlhcqyatbbsvnhamhjdin3tgaggzc@5yrxw5mwhkni>
References: <20251021111050.28554-3-krzysztof.kozlowski@linaro.org>
 <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021111050.28554-4-krzysztof.kozlowski@linaro.org>
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

On 25-10-21 13:10:52, Krzysztof Kozlowski wrote:
> Add necessary DAI links and DAI name prefixes to enable audio playback
> over USB/DisplayPort and HDMI.  The HDMI port is not yet enabled, but it
> should carry respective DAI name prefix regardless.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
