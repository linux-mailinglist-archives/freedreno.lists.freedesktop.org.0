Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB19E3735
	for <lists+freedreno@lfdr.de>; Wed,  4 Dec 2024 11:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28B1910ECBA;
	Wed,  4 Dec 2024 10:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mNMctgEj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32C5410ECBA
 for <freedreno@lists.freedesktop.org>; Wed,  4 Dec 2024 10:09:47 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-53df119675dso8053606e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 04 Dec 2024 02:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733306985; x=1733911785; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6GG/C0igHoeNKj2mH68ClLF3Ygx5izj48/Bea3x0gsc=;
 b=mNMctgEjvP6RxsfwoCbuHq6M7lsW82tXcNQi3y1TiBaGee4XQcNaIrVe9BHJu1lfSY
 h3Chd4CVzaaz1dzzKjgddHod+m14xC6spPn1QQiWqNEv2SirDUO6Zqmw7Zq7a2h5cY87
 leqpzE+ExcV+6gbqa+0k1k8PJ/xf6MMFzxnRGVGpVF8kXS0pIBIX67mv0NJPlB1/yOAa
 SFg8VB6F4MqC0MCfH+cVFeBXpL0yMlemU3cpmjl4tWnDSubCZ8QJZS7vRI93XujE+8s+
 tJ7xW6+l/cEdH5k/Gume8XCJd1t7FB11sVcpnOUPeAKgsP//u/BhEE32akAzQEXWz59L
 lTRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733306985; x=1733911785;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6GG/C0igHoeNKj2mH68ClLF3Ygx5izj48/Bea3x0gsc=;
 b=iDAXwyi+21ohTPU5llQ9PWGt9XP+zz1fYejzcfwifzUlzajCFdNkffpLjxTUBKn+dK
 REbKWmbNXxOIvB82cvWfxFE2BcynKusGgviHkS2c6Gcp5qRzBjUDoTduNS5HRbfF7O4/
 yFjTKfPhXRpQRSh8kty+e+DmKFy5CHLmL84igjYP0yaF4l6lIIv0/rygEtHo9jy856lA
 5w+4OGQYsnOPALG7WFdTfcjkKP0egqh71Xzn9M5ylqjDRToCY6SoBsl6KvSG/e2jmm8Z
 Nrnxj3WDvSuKGMQ6cBZEnKQq1ovF+7A7HI43i9Ho5Q0OUEoYeaf1zamQG8oWAHv7a6p6
 k5TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWBT4zaJ8SWCNJy2mVDmMIF6vyRqyJjoucsrl6jrWz5rqU5cJhpwCr4w2p1sEBMcSKsaZLDp+M8as=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdQzp8jGtou3fXc9RyO5jvvPVBXK5tntb3kPPRj560iIZ/FOev
 Bz0ti+5NEanWzW5WNPHjrjgiRU9LH1t5azl3Z7qvZZCnII0NnONuGC2SBccxmy8=
X-Gm-Gg: ASbGncvRj2ts61Aq5UhPgMK50cd9j7cayFp9v7zqBy+9jZyAoFLpXfBA/okUqlVYs9z
 YoG4AUNt70YejLBdAY9h/WW9FFVXmoIWcZOwRnkgA5KEI48Wg5n+CYWLQi9GXQrYiWPRW57njGC
 VF40ojrJBxn8GzHELxJGkY94LoJA74PFv++wQDozG/5fnByQtAPee91xbSHfp6pNYMvBmtr5+3u
 hD10Y5t8wIBYhFiat9JplO2bzBHIH5wD5FyKbM/tJYjZzslbOz6dEcyJ4eU6EGU2MunehVgYbq8
 diTLYeFhteMu8wjED8XiVAr/1Dm3UQ==
X-Google-Smtp-Source: AGHT+IFeChx3JdkEVrSx44qmoT8HCpAzvLzptFBGVf0Lu16LK9AmpqVP6+Unh/3j2hROlEszt0kJ2A==
X-Received: by 2002:a05:6512:224d:b0:53d:f82a:deb8 with SMTP id
 2adb3069b0e04-53e129fdd73mr3741737e87.14.1733306985190; 
 Wed, 04 Dec 2024 02:09:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53e14f97649sm495602e87.146.2024.12.04.02.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2024 02:09:44 -0800 (PST)
Date: Wed, 4 Dec 2024 12:09:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Mahadevan <quic_mahap@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: display: msm: dp-controller: document
 clock parents better
Message-ID: <pxi2nf4h34xtkickkkuwh4svvhbtsutuz5u3ukzgfgd5rzzcps@g4gct5zuc6kj>
References: <20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com>
 <20241202-dp_mst_bindings-v1-2-9a9a43b0624a@quicinc.com>
 <bfa857c2-cd74-4fe2-a88c-3b35a58710b0@kernel.org>
 <gpqrugcsyhz32bvip5mgjtcservhral2o5b6c5nz4ocwbjw5uo@eypv4x6jyrdr>
 <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hqe2pipkcnxftoq5mvdk36xmkj3ybr3oto6eghimq75rqlncsm@v45smglhedy7>
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

On Wed, Dec 04, 2024 at 09:02:18AM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 03, 2024 at 03:41:48PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Dec 03, 2024 at 09:01:31AM +0100, Krzysztof Kozlowski wrote:
> > > On 03/12/2024 04:31, Abhinav Kumar wrote:
> > > > Document the assigned-clock-parents better for the DP controller node
> > > > to indicate its functionality better.
> > > 
> > > 
> > > You change the clocks entirely, not "document". I would say that's an
> > > ABI break if it really is a Linux requirement. You could avoid any
> > > problems by just dropping the property from binding.
> > 
> > But if you take a look at the existing usage, the proposed change
> > matches the behaviour. So, I'd say, it's really a change that makes
> > documentation follow the actual hardware.
> 
> First, this should be in the commit msg, instead of "document better to
> indicate functionality better".
> 
> Second, what is the point of documenting it in the first place if you
> can change it and changing has no impact? So maybe just drop?

So, do you suggest setting both of the property descriptions to true? Or
dropping them completely and using unevaluatedProperties instead of
additionalProperties?

-- 
With best wishes
Dmitry
