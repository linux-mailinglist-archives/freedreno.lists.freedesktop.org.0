Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62645984EC5
	for <lists+freedreno@lfdr.de>; Wed, 25 Sep 2024 01:17:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E67D10E8E8;
	Tue, 24 Sep 2024 23:17:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="InJ8GJUn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656F910E8E8
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 23:17:06 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2f75de9a503so57101781fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 24 Sep 2024 16:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727219824; x=1727824624; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=amf3q/K5YstY5wPuuYpFOTakoTT4hxs6zudXgHWSQJk=;
 b=InJ8GJUnXDDU8vpXEsIkCK4qDHKQDNU6fNeB3/SU3/kWE0q2jVmgNvhmWhVzLqu9Ai
 icg0VAi18mnxhiTKXLj/9ka2nLeuM+HQPRce3g+GTGjNbYS8N93QwcA4QeraRVmsmKzf
 pnzKmJUPI2TV+H6rz9EhUEZKGKdcZpUWXMCo0hHeoCuo1JzIUW+DsM0Swn2VPzxMzfja
 hf4r8A3egMn0Hf76mxnb4fzZDuOYYy5AoSYCN3mWn2QBqHL0IdCmk4f1WfLGUb9qS67W
 AS7mJM4DJucLTwlMZxQLJacM5wUapZBPbqz8Yj2fOK7W0QQmO806p6XPTFndJkBAwIaD
 /t7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727219824; x=1727824624;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=amf3q/K5YstY5wPuuYpFOTakoTT4hxs6zudXgHWSQJk=;
 b=RlAsBT10/ZH4qUuASCAAX4Yna5tU/zXJhleQfbQtAqtZnWwtOWiMXtRw4DJHqJJUdj
 AUWb7F/CjobDXDVLPfVXTHsJNAbkakLF3+F5p+Wu0femTYlWRxhzDWkqGMS2TWAIZvf8
 6aonJk3beN9KNAOTzXhK1kJmPEj0cZBmtgJK0FeW4JrmZ1aMkPfTR1r8xOKgvEF7VrDZ
 3mENYnMecycM0EoKbzHVtYrC8Lxd4H0GmG36MPgaoRRBw5hXmzBRvftXwUvF7cXznRuv
 d0bz77cmL4X/Qu6u9t1ANt2TRKFIZuCkfLCZU1g4hjVOLsBLouqsEyJcgPVr4TmCmXqP
 uMSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWL8UUqP3Wl0vX1fHr3jx+3E5smO79RrlnZ6CqO31986aAKTC6CXEuvcYr3opmuo9R6xXeaam1NBKY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyqOBsmhp30aiPTZkFVSiQgVJ40nZ6MI461BL+RgNffnvcJttot
 NwdbSxAe2xVDGocfvQ/BgqQqRV5bXns3dPpL6geO9RXUmBtM6wXwxxsZGVEzq8g=
X-Google-Smtp-Source: AGHT+IHrcqwe5Lj4ifpe/VvN6Ok72x0l12WG1jRQc+gjBjBJs2YI2Wo9HDUJ71yLZDgpMhF1y7Ff7Q==
X-Received: by 2002:a05:651c:50d:b0:2f6:6202:bfd5 with SMTP id
 38308e7fff4ca-2f91ca426e9mr4371961fa.34.1727219824482; 
 Tue, 24 Sep 2024 16:17:04 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f8d282ff00sm3383631fa.25.2024.09.24.16.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2024 16:17:03 -0700 (PDT)
Date: Wed, 25 Sep 2024 02:17:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 07/22] drm/msm/dpu: Add CWB entry to catalog for SM8650
Message-ID: <w2af6gh45xiw3p3iruqemftdysmyv47cxftogalvs33nrad5xt@e5jrv7bk4adl>
References: <20240924-concurrent-wb-v2-0-7849f900e863@quicinc.com>
 <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924-concurrent-wb-v2-7-7849f900e863@quicinc.com>
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

On Tue, Sep 24, 2024 at 03:59:23PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Add a new block for concurrent writeback mux to the SM8650 HW catalog
> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h | 21 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h      | 13 +++++++++++++
>  2 files changed, 34 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
