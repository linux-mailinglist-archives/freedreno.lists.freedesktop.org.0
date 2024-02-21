Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C584185ED46
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 00:43:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C87E10E840;
	Wed, 21 Feb 2024 23:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xgivbrmq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66EFC10E68C
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 23:43:36 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6089365e554so7105817b3.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Feb 2024 15:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708559015; x=1709163815; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TeKcSZmt65tsmCjLBYpPtTH5m7PahVEvnN3gp1BBP6k=;
 b=XgivbrmqC6j31FGZZXV8eXlmh6k5dKEXorHlRFQfJ7FrxgxAZG8QRpXgtQF+HPsLme
 /7RNNje6Ev1c381P9y//jmwdOj4jfdeCsJirzQvSEle9ZaWUIwjTn0vCT4gNPoHdzKwH
 NKmCZW3+coMcaNKzrtSrINyeCm0z2+lrjtrE1vaZoSjDbuaHQOW+OggUnonqVewHpl+W
 t/CsZdQ7LVCoNMoCq7dGXHtYGb2q53dHgzySQj3wA2i7QH1OOXycDpmV5k2ivTBFWpJO
 9JO7gco3PttcVVXvSKB+fAcJfWG1WCxAnmOm6NWr3w1Vs6qaFvl0EdTln4N9ElycsQnr
 hxUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708559015; x=1709163815;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TeKcSZmt65tsmCjLBYpPtTH5m7PahVEvnN3gp1BBP6k=;
 b=fqBeMLkElYCjP4EfC2BSveDCOR3jx0ocHYtwYp/CkTuL1mqAAXWELcJjIIHlj4S0I0
 AdVbv40c6o1gV4C3iVhxeCO8EpzMPTi6WPITW7jw/48k/jvA5VpJDS+1M4oAMj9Waeke
 3zu1VB+ww3r+oxBxap1kPqxHKD3mRCFOLwqV5CXTy+ADtTXyHX4Np+mAkbz47dQquOt0
 ab3uDFyP6OFlG6QhNZl3tcI0vh+umIAaPZd3ObyQq/pvYIywFYzISTd+ZaBwQZQFxk8y
 vE4Me4WFDnC1eE0nUN1bCS4AcTc0O21MoIoA5/hHCifMHPM/CvV5HsOJwvRXgMEurygt
 Td5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQwv7ZdG3XJ88uZq1AUFm/pQTAxvIKxKl+PFOa7HvkojyijiVLGgN6FMuv7mbcE78I2EqsClD4fMpn1cPAkRvM00kQ/PXEnP4JCNBYXU7W
X-Gm-Message-State: AOJu0YyWK32lD1NAPFo0sekeHyjN2FC7BkV3Oux0mDNtYnXoMeTwSPmm
 S0zdzqpG07KqQW3U7bHZ8FiVupKnb42HHt0BjvJNBxA0L3UvyBhZlzcdgJDooUEoWMvFitWvpFK
 Gzn8LJUKUCVptHVp+UzVlRDsohvCcU0CGzc5imA==
X-Google-Smtp-Source: AGHT+IG23RX3mHSoDqoErDFyzvZxTP87XzpGlNSEMdnMYBP/pD9KffhOLUtQrxf/OysVvdyJWsXBSnZq8SFvxdWTc9E=
X-Received: by 2002:a81:7e47:0:b0:604:9232:9df with SMTP id
 p7-20020a817e47000000b00604923209dfmr18226833ywn.50.1708559015381; Wed, 21
 Feb 2024 15:43:35 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
In-Reply-To: <20240221-rb3gen2-dp-connector-v1-9-dc0964ef7d96@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 01:43:24 +0200
Message-ID: <CAA8EJpq7yhbyoJHsRxdek=3XJ154nt+e5OLAE9ucPV5p-FOrEA@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: defconfig: Enable sc7280 display and gpu clock
 controllers
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
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

On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Enable the SC7280 display and gpu clock controllers to enable display
> support on the QCS6490 RB3gen2.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
