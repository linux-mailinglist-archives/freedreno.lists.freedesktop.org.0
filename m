Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E7885A35B
	for <lists+freedreno@lfdr.de>; Mon, 19 Feb 2024 13:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B41B10E3B6;
	Mon, 19 Feb 2024 12:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LhBGA0v1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 551DD10E3B6
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 12:30:56 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5120ecfd75cso6206877e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Feb 2024 04:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708345854; x=1708950654; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=InV03Ory8WK5p4H1r4kGN4/4DZ3sZm57s/DE6ff4jSU=;
 b=LhBGA0v1bsngbclPwoiKYNjOqR6o5gIFcOevoUQSljtd1W6679QzRn+R+LIql4WTPb
 dqmmUaJCmNLR38KS/2Mtzox6uMfAsyFrXCBr3rnwz2L4drV/yaSn1yhxx0+cosuqQ6Qk
 7JaLwEZz364dCyLTs/W7tkzzZV82TfwcFsOGyTkdrDkA2VTmAyV2LZMKSbzdRUPIjIxQ
 fErW2fXDdOGPQ+DKKulw7eyWggJUmnEpkeTCQTtrcsqLuX42nfb2cCdgwdzn/IeFz92I
 mlp2phgJKlArDVQERflWN4otTj/8QuOB8XDbspZY+jXuwJ+HVzLnALeY6KxM6I7qGp2N
 fLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708345854; x=1708950654;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=InV03Ory8WK5p4H1r4kGN4/4DZ3sZm57s/DE6ff4jSU=;
 b=ChtEVZ//l3t2Xht04/ebHcxWw4QOBS4xNyhlE6J/qBzYxDxzchScn1l3ufJiRDACXz
 hD5JRBK0RUXnJMpemHMzI0WXjFF7tPvmAGbwGI39ykesG74tYkazuaAQ0Homem/uStbr
 jLea0LnE2aBemBDwekjkyzaTF1mZrpcqrEg7L6qX4rP6DKbeesNBClmt52OAUZT+V8Jx
 liX915UzL2VWr1mWL4znEgAl5z+j4Yxk9HxwbHd7UloxX21L9guS4NbeU1luqeFbAs/d
 g7cJAMSE91a/NsU943ep0k436jvAjeswbXrQZ2c1VHcYv0mKNOh96N8Gax3HJoG20dZi
 BGYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVckn7az3oynwyZUIGQfNFsLqAZpk3z1+hzX2j0M4/zZh8Uxdxf1oTo7n3i2Z755KSdA0MWfHOfY4ZuES63VGZYQH53QzSfALcVUuPRuwJs
X-Gm-Message-State: AOJu0YwzdJJmOY9w9B+0tZRTLdS7fe9WRa/WodEBjd9Psz5ftlasB93H
 ktFypn9g1GmKloSQza6D33k7kpONdZXhwbGtBuVL/Ai1lrxXI7NRGYe+0M2gWp4=
X-Google-Smtp-Source: AGHT+IEcY4yQmQxAJ4WiHYNwm13YvwEPV231BSoILkJGjdFG/MMBbHe/M71wgEdW0/b/Egu1Mq4h0g==
X-Received: by 2002:a05:6512:3ba8:b0:512:a743:3ce3 with SMTP id
 g40-20020a0565123ba800b00512a7433ce3mr4488709lfv.23.1708345854485; 
 Mon, 19 Feb 2024 04:30:54 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 i6-20020ac25226000000b00512bde4cddfsm90466lfl.148.2024.02.19.04.30.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Feb 2024 04:30:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: msm: sm8650-mdss: Add missing
 explicit "additionalProperties"
Date: Mon, 19 Feb 2024 14:30:43 +0200
Message-Id: <170834569504.2610898.11072295234530995616.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240202222338.1652333-1-robh@kernel.org>
References: <20240202222338.1652333-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Fri, 02 Feb 2024 16:23:37 -0600, Rob Herring wrote:
> In order to check schemas for missing additionalProperties or
> unevaluatedProperties, cases allowing extra properties must be explicit.
> 
> 

Applied, thanks!

[1/1] dt-bindings: display: msm: sm8650-mdss: Add missing explicit "additionalProperties"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/4825b207002a

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
