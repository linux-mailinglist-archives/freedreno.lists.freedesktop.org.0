Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522D9AF997
	for <lists+freedreno@lfdr.de>; Fri, 25 Oct 2024 08:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB3CB10E9F3;
	Fri, 25 Oct 2024 06:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TVLmgzYE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD3C10E9F3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Oct 2024 06:09:47 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso22563851fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 24 Oct 2024 23:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729836585; x=1730441385; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WGSwOfNTwBF1RVfw0bMgmzFOpa40Rq4a6Ot02SFfHkk=;
 b=TVLmgzYEGmuWcwxeXxmMN6A2PhtEzwXLtn8Un2HlGQ6ddmFJKqkSQoiUoa4Ig51/9S
 8PiI64n1BOE/QOajmMejcS945qdyp6Gz85Z8eAUlxMuHu7d6tfLUM0tF5Yn92y3pODip
 mfkZQv3+1JWGmf1o9/OiVaW926Grfgvm1k8LgbH3NntgMZDoilAwoI0J32vIlrWy0UuJ
 8v0IW7A7QF7caO3DLrSLc6zbHjgjDdnCNCPMjXbcHKfSozHoZWLeEO2xILFEEYXE+XQX
 f437fgCjIEI9MP1utxRt/jhpxiFbJL2hf1VY70MG+YwN8ez1+sjJ+0iK0LpsNrU1iUTa
 bAvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729836585; x=1730441385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGSwOfNTwBF1RVfw0bMgmzFOpa40Rq4a6Ot02SFfHkk=;
 b=PIYnICzQa0U5p4c4VHfIZqtpiA5a0YEHQ8VWBK58Zjq7K5bYcvD+RarqFClWXOZOWl
 tTx6whnO58A5kEplLaPJjemOu+sNheJC2MRiR1fFtKPkNpLUwBb4E1afzJO3dmxfKZnq
 WDn9jBaUBt/4UEYtEJCiYMPTccADm8zgL8uDIyH9dN3ULlyO6HVXZVB6QlpG8sWlRlXw
 aJeSZXJoJ/ieteR2K9M3rCtI9Y8wE18Z2aTGfrLIyZmvGQfed8IEeR2UIjFSM25a63qN
 jc72DJDiEkA25UiTzQdXym9NvQR+ghh6rVkPang5rEhGyygTJM7rwhgsmu0hRhoKJKOv
 Kw6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV+KIxxGRnMyrM6Dc68B8sHwGpCYPgFBazH+H7wxkNcNZ7w5CJoMdKMQK4lV1xqIjUXzfoIxls8sPQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxMXPxUnJ6hmD6M4PUQAskb68BYv0Xbw2GHrF33CQKX9p37wNVT
 qj7DC38pPPcR/GyNSkBM20C1xuo0HpQEctvIJjjbcnE5VDZCnmUqYtfv8UN4ebc=
X-Google-Smtp-Source: AGHT+IH4kY+TfZ1uw4oFVFJNs6S8ff7aK9mZHUyqqpe7W5BmQI8FuCowWenPXdGmTodC/EhUEC9URw==
X-Received: by 2002:a05:6512:258c:b0:53b:1e9b:b073 with SMTP id
 2adb3069b0e04-53b1e9bb2d6mr7381629e87.3.1729836585041; 
 Thu, 24 Oct 2024 23:09:45 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e10a915sm64598e87.12.2024.10.24.23.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 23:09:43 -0700 (PDT)
Date: Fri, 25 Oct 2024 09:09:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
Message-ID: <tg3jxbw4dqafaikl3yfvbl6jwou4ow2t2dnknmm2xpvbkjejrb@7yg76ykbxjns>
References: <20241022-a663-gpu-support-v2-0-38da38234697@quicinc.com>
 <20241022-a663-gpu-support-v2-3-38da38234697@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022-a663-gpu-support-v2-3-38da38234697@quicinc.com>
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

On Tue, Oct 22, 2024 at 03:16:05AM +0530, Akhil P Oommen wrote:
> From: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> 
> Add gpu and gmu nodes for sa8775p chipset. As of now all
> SKUs have the same GPU fmax, so there is no requirement of
> speed bin support.
> 
> Signed-off-by: Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 94 +++++++++++++++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
