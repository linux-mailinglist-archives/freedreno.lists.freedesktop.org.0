Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6F7A3BEF0
	for <lists+freedreno@lfdr.de>; Wed, 19 Feb 2025 13:56:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D312010E7E4;
	Wed, 19 Feb 2025 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GCrLyumS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com
 [209.85.167.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5596C10E7E0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 12:56:14 +0000 (UTC)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-54605bfcc72so1009094e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Feb 2025 04:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739969773; x=1740574573; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jpdeNF19DgfEm3H7/Uvp6T3atcP8vyt6RGMBKgTt3ic=;
 b=GCrLyumSXDRhPnete/yMEsa0KxhcC+TQb3iE9Z+Y81afzBzj9CjWJNuzPclqlBCVh/
 XszUoNFtSZhUkdPJnf9V7iD9OItsALp7HlfkRlTgpQNjff8AiISpZ/NYXkp0byLtyikK
 lYg7lJdECnujL2PVE/JLBxJyUawHxOFdK49o6MDUgenwXDQbWsUmbZXGbtQeSJe0D3gL
 8dWNBV3lGPf/xQYJoxRxghpKF5LD3jxL3rGIXo0IVih74o/7D3bJTGRW+Au5FyAo7P75
 5Z/ZsI2lIycGzCH3zZ5+Q/O/xaCgs1A0VgTYb+ywYoM0ka9b53PzOn4/jOXLZUcexAjX
 Z+UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739969773; x=1740574573;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpdeNF19DgfEm3H7/Uvp6T3atcP8vyt6RGMBKgTt3ic=;
 b=uju0ik0hUF7PkaB4/yqr+5Vlo3T+wMtF/zCgfblcyM7OGPH65cfJVJ5277lxfcNXZx
 IiMcSbvWfm+Ef7gNJbcXWNlS72RvcRHTGig1h0x4aQDFlQdzQLGJZVxjWb9Wt9w/MWK2
 gCg3ZO+QTDPoblx+R1PefgkvfhHZHAz4/TUNOIaO6UabEGTe8b9gNPjVT3QxPo613XXs
 TN0eZ+9qRrGiMyPNrWHPEj2RTX9JGd0tISaOek5il3QoX8KPkML2EMZNdELLzO7q6voa
 Z5Yi7Tk9nlkieILiqkUr+WnkGdMoD9vPvTU3Xf8AIqSKEJ2pW5FsaimpSUo1c5b+Je0Z
 6uBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3EyX1LiL4eKYM8FqWCD57fM+s3ECqG7/V5vJj0wCmkUfd23ArDgXpeHs9/sPo4uUEEGOsC4glqIg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywey2TujSUndnNtuTcbbG/uPvzTVYZO5ztORUNCwE3B9iYZW7Af
 6qPCW+OkK8a0A8rgn9LlaLm5XaUfJBVzDOGVdTDB1DR1RQZb5n35VySCikRD9b8=
X-Gm-Gg: ASbGncv8jR3EjvQSRmYD9SIqdUz5EN0XCdrItrdLzuBKfDxHpVE2OkyyO3nhqplzmDZ
 N8nR2IrFH47H1xMgvN0kcennDqJk17jeF8kKPzfK/eYOVe4hPd7mrKEvD3tXJqqEJyCdX3rO3sk
 iKvIf/6+XdV2L3dm9FLQVxw5vf0BRUpEPr0MNuZaSYlBXS97h7G/+yU0PK2yunhaXp8ZSFUKJU7
 IdQY+zAafOTw++trB9F9UKUHUH3C6iT1tB0GO+3I2Uhk+mTYn3xZSbGNtm5lCQL5WNdocgA9Liv
 xyhYmvw8BA7HDjbWjrH+B7rV5ZZPPwxyxnNFR2ut1RCnvZsTUMHePT6Qpn25aBdKqPWjjFs=
X-Google-Smtp-Source: AGHT+IH0YmAtnjvMy5+btGUvGsvhy9fusmwBi9HtyhuX25OtuhvvQajrAtK6BmKWaYMSFy6bf3k0Sg==
X-Received: by 2002:a05:6512:3b23:b0:545:550:83e6 with SMTP id
 2adb3069b0e04-5462eaa1f1amr1151645e87.5.1739969772537; 
 Wed, 19 Feb 2025 04:56:12 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462c60f99fsm421664e87.118.2025.02.19.04.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 04:56:11 -0800 (PST)
Date: Wed, 19 Feb 2025 14:56:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display/msm: Redocument the
 dp-controller for QCS8300
Message-ID: <yjt6wwzrufigpuotsspoolnnonkueyb6evk3gtrtb6zpceuinu@em3ry7pufabw>
References: <20250212-mst_qcs8300-v1-0-38a8aa08394b@quicinc.com>
 <20250212-mst_qcs8300-v1-1-38a8aa08394b@quicinc.com>
 <wyd7i47pkafa7n2yjohuvlh4btasxle4rw5xm55h4bhv24yvah@pfo224xz4xfl>
 <b4008932-ce56-4cc0-9b53-2253051514da@kernel.org>
 <CAA8EJpoowyKcwDQgbWy4xGHzngNQOcWt_z_Xc49GFB1qYjYO6A@mail.gmail.com>
 <0171746e-1d3c-42e5-9cde-7dcf2708ffc3@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0171746e-1d3c-42e5-9cde-7dcf2708ffc3@quicinc.com>
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

On Wed, Feb 19, 2025 at 05:56:14PM +0800, Yongxing Mou wrote:
> 
> 
> On 2025/2/12 20:26, Dmitry Baryshkov wrote:
> > On Wed, 12 Feb 2025 at 12:54, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > > 
> > > On 12/02/2025 11:41, Dmitry Baryshkov wrote:
> > > > On Wed, Feb 12, 2025 at 03:12:24PM +0800, Yongxing Mou wrote:
> > > > > We need to enable mst for qcs8300, dp0 controller will support 2 streams
> > > > > output. So not reuse sm8650 dp controller driver and will add a new driver
> > > > > patch for qcs8300 mst feature. Modify the corresponding dt-bingding file
> > > > > to compatible with the qcs8300-dp.
> > > > 
> > > > NAK for a different reason: QCS8300 is still compatible with SM8650.
> > > > Enable features instead of randomly reshuffle compats. In this case,
> > > > enable MST for both architectures.
> > > > 
> > > So the original patch was probably correct...
> > 
> > I have no idea. I'd let Yongxing Mou to comment on this. It would be
> > nice  instead of getting a lengthy explanation of obvious items to get
> > an answer to an actual question: is QCS8300 compatible with SM8650 or
> > not. In other words whether they can support the same number of MST
> > streams on each controller or not.
> > 
> Hi, in hardware, the SM8650's DP controller supports 2 INTFs, while the
> QCS8300's DP0 controller supports 4 INTFs.In sst mode, only one INTF will be
> used, they are same, but for MST, sm8650 supports 2 streams while qcs8300
> support 4 streams. Thanks.

So, they are not compatible. Please use separate compatible.

-- 
With best wishes
Dmitry
