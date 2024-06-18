Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0966A90C8DF
	for <lists+freedreno@lfdr.de>; Tue, 18 Jun 2024 13:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCBD10E54D;
	Tue, 18 Jun 2024 11:17:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="l9O6gl2I";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75B310E54D
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 11:17:31 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-52c85a7f834so6822221e87.0
 for <freedreno@lists.freedesktop.org>; Tue, 18 Jun 2024 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718709450; x=1719314250; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RQ+i+yUylzc0vNZND2yRwe4IaOpgkA3NphEu3B2GdDM=;
 b=l9O6gl2Ilkg19M9TSDKu5KdpB6hrwzuPCDtx+ilFchoYB0FohF+pVL2i+8fg5P/a65
 bzTarn/Vk35gBX7HMwTichLtG8efHVsqavhj+0ZUJPxW8qFuS7RsMZqH69Vg7urFWPXM
 UQyzBJ/DtoAFjjNUmI6qD44u8tYV659nvgx3hY1xmSmK6TZUseI6Lce7JibVJBEb/vz6
 4N+FHzkhuXenvGWIBblK53tj09w8yRgUlhWvbqTEW5+nZcoR5ERUVRdQIm9G94EbnN71
 r2MCQeNDvdfyL1532Q2NpXTp9m2BOMqflJRFDwmOvxNrJVFYENksV5tLfRgl/GLCNFql
 QnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718709450; x=1719314250;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RQ+i+yUylzc0vNZND2yRwe4IaOpgkA3NphEu3B2GdDM=;
 b=VUCAA4jA7KZv/tvp0TUkmgE4OawmmgvDfjYE3gldEnkf5CbKq9jP/wWiiAYGBKf28Q
 eUoqw69HFQfpCTjbFhtgafPv8NRhxY/LonB70Lc18WdGnD+h0UWn+yL50iE3AcN2P3QA
 W4dD2bbaoQESfAvM1A1G0r8MUkm2PFoGF56nQfBUnaoGfv6Qa4fLwDaPu8y2gwXGFV2O
 lTumDJ49S1eiOY+ey6baAKis3rmtNSq9FmUuun8tk1/BVzT9uBuJSV38HMxS6g7f9QO8
 ZMlmo3CDiHmJr/7jCBKeNOVjsdDoJ2v/bE3yMbqYEixKmKGx/ASmh+UPGicM4psUoVFa
 USXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUOodsCq25UMhEMnOstftqpcijmXy4+hHSjdlm4Nmob7YEUzKD5dVRUjEUvfhLXladxSeD7+Ira0T3ngzqjm5rM30rCGbz7FlEqrK9RHUI
X-Gm-Message-State: AOJu0Yy8Np3ENie2ap8ARdqoPyeGC1Bnb8y7T7R9eRAUcokbXPR/G3lY
 suCbK549FAU5dWMEU/Fyjgxe0q7F3MBFbsI1BT82CJu7t7o5T5/Hjsl2tj+InDU=
X-Google-Smtp-Source: AGHT+IHHBBxjqquwzsz10R7mhJV/FLoBeBD8boOTDbExy+3KWVhzVyEG734oQ2FbmXMY1nRFQiofEw==
X-Received: by 2002:ac2:43dc:0:b0:52c:82cf:b80 with SMTP id
 2adb3069b0e04-52ca6e9a0dfmr6058474e87.63.1718709450007; 
 Tue, 18 Jun 2024 04:17:30 -0700 (PDT)
Received: from ?IPV6:2a00:f41:9028:9df3:4fb7:492b:2c94:7283?
 ([2a00:f41:9028:9df3:4fb7:492b:2c94:7283])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2872480sm1474922e87.157.2024.06.18.04.17.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Jun 2024 04:17:29 -0700 (PDT)
Message-ID: <290fb9e0-64ea-45ca-87e6-70c0e6edd6a1@linaro.org>
Date: Tue, 18 Jun 2024 13:17:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] drm/msm/adreno: Move CP_PROTECT settings to hw
 catalog
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-6-robdclark@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240617225127.23476-6-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 6/18/24 00:51, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Move the CP_PROTECT settings into the hw catalog.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---

I think a702 was skipped over

Konrad
