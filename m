Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4289E3862
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 12:10:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43A9910ECD8;
	Wed,  4 Dec 2024 11:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="weqflYIK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F336D10ECD8
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 11:09:59 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2ffdd9fc913so70212291fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 03:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733310598; x=1733915398; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=qmvDv+aJXodq+mhX0D5y6kJ1JtvDvnKdqZyOWQy8lzc=;
 b=weqflYIK3JMCTXP7541RqQNTgp21yTE4tV5X0oGPquG2hw5KTPT7ybwQ5uZEWLwd8W
 U7/ddBwpMkMFLsElVAmll4OUIre9sis2p8YdzKIYWeZXvkTlpl8ymV5EywwaJIo8HGxh
 wb7TqwaxB0sdNU+w6xL/t3poGwxNe9LmwNS3bZCd1RVUfBCKnOAeucHY1aLbBMiYmZ/O
 Q+vO3zJX06r/oW1vl445t6xtA/HPtoQtehRaSQ5+1Zj4lUxwgofG/bIjjqIyV4dZfMSB
 oKOTHdvDyxZFQlq0AX9n9QiVb06WAvI+eFTFYAkKCUB092Wt6fIziqFkLgkSvYobRPoH
 lPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733310598; x=1733915398;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qmvDv+aJXodq+mhX0D5y6kJ1JtvDvnKdqZyOWQy8lzc=;
 b=FfhNVlNgTjfZ1grrLvwvDodU75LfEyUgDIrY08DslESG+mqY6pjUjjRNn377rR/MEo
 2peceWzKUXSaFIPwx9RHHMfiBnAf9AldEt8YHmu8VLxPi4X6ADQMafzvQCCTVq4qn2uq
 wZkzrcuJZJLUwBZpMP1NitysVJJhQf9r1LEa2Y1np/xYVDIAG8K4+shXtYzIZWbVYHhd
 bHsGeBQOCrKyZUu3+f69jiRHCR/RxKy7Q0KTKgmL1VfaoavPRdQLKer5Ufbla3F+7ZLv
 L72K4nw3LgFgYtVcLFvuqFmVnNiktXv+AbDNwR+759fX+ON4cB83B7OkEA1OPSkF3Svb
 21lQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXar/oPKFkIDnjQ33vMWNI2NSNua0mwp7z26hGe+HiuqLJiD+iUpwXAahyAwL/aG6DMUTTmIEY+rLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZxMZitzDzRoWv1s6x/OgPzZ7PcTJikeTW52UOSkVk1SPqumUf
 9BvKbrXbyqj7EdyBtovCDqgmdVtmoSQfiJYz2XVL7Uv2FawIbKrqVG1Q2lPbN+o=
X-Gm-Gg: ASbGncsSObqpl51bL+CNNrdQ32GGK4C+1timqSkpkA3gOyfoyWxn/cQtAS0kN8XwSqH
 SNj9GKbfEsaAWfCmArShC56giOq9OZYaK1eDVNnA6fNiQ1LRp8QGouOlcbQDeON9B4w5IeJXQX0
 TX8d/XxgKAFiUB2nZikCGxYz65v6gr6ZSBibhIpRS6s60mXjFD0YGxGRm9KRYXkOGhFH3tyjFlx
 XtHq9IShfFyxDBK2dp38FA1A9OGjiXt2jmbrZKgAUJwJG79gVJGwKMOZ8EsilMRujVn7fOq6YVQ
 3SpjZx+r3otXTJdxGHpgmnmE34qS/Q==
X-Google-Smtp-Source: AGHT+IFyqI3egCOEc9OzhfUKK2S/yE8XPBtr9AUCyqUOlyCRKeSwjfIHLpWDvtQ93zwWyBHTRLlv9g==
X-Received: by 2002:a05:651c:b1f:b0:2ff:d81f:2d34 with SMTP id
 38308e7fff4ca-30009c0de15mr41820741fa.8.1733310597934; 
 Wed, 04 Dec 2024 03:09:57 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ffdfca12b8sm19252051fa.99.2024.12.04.03.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 03:09:56 -0800 (PST)
Date: Wed, 4 Dec 2024 13:09:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Robert Foss <rfoss@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: msm: sm8350-mdss: document the
 third interconnect path
Message-ID: <e2ldpjkymkqz7twlhfthba3datrdunacay23znikdregd5p5mb@vwzpwhushgmw>
References: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241204-topic-misc-sm8350-mdss-bindings-fix-v1-1-aa492a306bdb@linaro.org>
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

On Wed, Dec 04, 2024 at 11:36:37AM +0100, Neil Armstrong wrote:
> Document the missing third "cpu-cfg" interconnect path for the MDSS hardware
> found on the Qualcomm SM8350 platform.
> 
> This fixes:
> display-subsystem@ae00000: interconnects: [[121, 7, 0, 77, 1, 0], [121, 8, 0, 77, 1, 0], [78, 2, 3, 79, 16, 3]] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> display-subsystem@ae00000: interconnect-names: ['mdp0-mem', 'mdp1-mem', 'cpu-cfg'] is too long
> 	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> 
> Fixes: 430e11f42bff ("dt-bindings: display: msm: Add qcom, sm8350-mdss binding")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
