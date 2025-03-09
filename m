Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A25A582F8
	for <lists+freedreno@lfdr.de>; Sun,  9 Mar 2025 11:19:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C5F10E30B;
	Sun,  9 Mar 2025 10:19:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kDIz1gex";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A8BE10E30C
 for <freedreno@lists.freedesktop.org>; Sun,  9 Mar 2025 10:19:46 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-307c13298eeso39004851fa.0
 for <freedreno@lists.freedesktop.org>; Sun, 09 Mar 2025 03:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741515585; x=1742120385; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6s2IN28UcJK9AIeEgePs+AKeLtN5DfXNmrIRckMBKOk=;
 b=kDIz1gexGFKxiItHtZ4yN6bEwSOd0vGkDkvZpz+rs2628BvUkcYN42r6BDwFP42KpJ
 h+Wx9ZeedNUPCFbeFpuFuUKg/ZY86ZSHL7ncGaxJ+0uPiy5tQE+nde3N6dBF/bSH55eh
 3TZ/Gi6SG91x0reXplP9WRGp9GT14fXOddnyLEbLA3YA6Ih4e5NEv6NzI8k1jvm1zwBZ
 I7X9EQkQq0g5s6LKBoKAWNBpsXUY1ezw6KmT3oVoQsT+ODvJACAnx7Jbkl4XLgzM9hEA
 JZ9AQYbMZfP+VcMosZkDAnwLSsSb2W2qXR/FXFeSVlQr5M8E6sJ+mFSP85UXBgfA/UVk
 Os5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741515585; x=1742120385;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6s2IN28UcJK9AIeEgePs+AKeLtN5DfXNmrIRckMBKOk=;
 b=pYSXmABfhHJi4nlhrrNYClUmp89NIPPGvK998dcHFWKBvmoUdgsblstCbFbw1FAxdM
 8CU2np40MUhJMRJ1E9wzeDsi6DM3s6dMpesqpXda2tuwA4YY0STy/ONdZ1Ey0N9GZIkX
 W/gxk28WWEmn6Xpf6B1GhY0tIDp4N1QhEpe5r9aspR9Dm7uK7/lV5x2Df6BFARc1NA35
 bKbs9fhTS78vBZmBH5OX8yRr45F+JphO40svE0TashzoFzx0vMv3i4Zxr8e2cRvbQFjM
 ieCL6/iZtbXFhzHkfoyzpRowH2rDDvaEfzjyc0QcOo4BN0OQ7gY4LfAWbFzZLbTscbIc
 MTRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpbFpzrTfNzjY7ys4TskDc6IWzKqnbIBuBTAZO5GhWhtVEsLIZgchwG7/Hk+00LMg8Tg+GZ5LSpgM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd1dgbhYDuAL02Kn544vpEBhFgOfFFTZCHwRCF31uX2holNC7H
 4rZmI9bnFeyAo5VBUtUIevo2u79BgPuIV7VlHAs228sZYesrD/zsnZ6ptuIEYTU=
X-Gm-Gg: ASbGncu3BuzS5ni+ngE3kGlMK1Kyt/J+kOGDSCArK8axBHcDGsoF+WjApUXXhc9Y8n2
 8nCvNM8Gcdt5eABiUX/uvPJTy6Xt639vN8coa0z4TjsFgIkFwvJg+3TO/nNp8xepcnqTppNtHTB
 V6X0dcZSfCAFLEy724+dxLZCRmcP+WAzfQ3YwGTrWy6VDMjZ+fTqKydh93awHfnvNATwZzD//fi
 M/UOF+SM/PNBis4BFLwIvpwf4wAMEkXnYiNsR/a1YD/pVo+71LyyLayu5ju6sWNYiOdcWHSVR4N
 lWrPZbA6p4la64O/o2wEbf16Qp1qD7fmSsMveg1rR2J77VpjlWhzC9w25waHGPaC3kfLjDBZeBj
 WZBEaB19imWiIKGTNdVYWroWqt51WbqpmSMg=
X-Google-Smtp-Source: AGHT+IHlBdJ1qjhe/o7S4dso2ZCEpH6o3JPt/ko/A+fRZieBU37zQ/ClCK+PPXWZo0QJwKYGgx8DEw==
X-Received: by 2002:a2e:a985:0:b0:30b:c36c:ba96 with SMTP id
 38308e7fff4ca-30bfe3eeeafmr15772901fa.1.1741515584802; 
 Sun, 09 Mar 2025 03:19:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30bee0c8565sm11460361fa.53.2025.03.09.03.19.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Mar 2025 03:19:43 -0700 (PDT)
Date: Sun, 9 Mar 2025 12:19:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Qasim Ijaz <qasdev00@gmail.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
 quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: reorder pointer operations after sanity
 checks to avoid NULL deref
Message-ID: <s3zlxsj6gsmoz3rc5fqopi7etfibaurkz5oo5wgvurebx2z3zt@t3h73v5lcmhi>
References: <20250309095525.7738-1-qasdev00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309095525.7738-1-qasdev00@gmail.com>
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

On Sun, Mar 09, 2025 at 09:55:25AM +0000, Qasim Ijaz wrote:
> _dpu_encoder_trigger_start dereferences "struct dpu_encoder_phys *phys"
> before the sanity checks which can lead to a NULL pointer dereference if
> phys is NULL.
>  
> Fix this by reordering the dereference after the sanity checks.
>  
> Fixes: 8144d17a81d9 ("drm/msm/dpu: Skip trigger flush and start for CWB")
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> ---
> v2:
> - Moved Signed-off tag below Fixes tag
> - Moved dpu_enc declaration to the top and initialisation below sanity checks
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
