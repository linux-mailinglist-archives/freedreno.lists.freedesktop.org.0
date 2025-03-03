Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BF9A4B923
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 09:24:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6271510E39B;
	Mon,  3 Mar 2025 08:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Vs1kD9hR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D5710E375
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 08:24:32 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-abf45d8db04so316268866b.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 00:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740990270; x=1741595070; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
 b=Vs1kD9hRoUfaxNT6/jDUNsK9jMIB1XbdewSunHyMNtpgGLMI5ctyJ3EG/RaZD0vVPd
 rkZx3oGN+QUMLTeFGwHJxQGZTPsSQCykijAQ0VOi/6n1+45TpAO5/XCQ3C0xdpEiSDaK
 vE36m+eOhmey04GhPyl/2Fdq0cio8COZThYRp0G3KpjAuN9UJ2ASxv6JVMUu9UaZ2SJp
 Bs7s5PsW1zqOK7cL9ulgvgn10si/jNdLa/B40AzJ4EJBWhp13mqx0CiKUWv5yh9imYvX
 io7ywGyuQvI2vmT1NvvrO38Sirrv/WbISpXI0mrr7VkuaYKs6ondDrO2WkNMimYvA383
 gCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740990270; x=1741595070;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RaZ/CcmeFoBTR8ddNDuQVJv3AT8EACnAOxQQ2V8mS5A=;
 b=etWAyTULL4klK5lN8kgZeRhu54+LoMN5BjkRipkXTtv+ArL8KQDcgEfRIoO3aW7mAc
 9rq8ZsZqpFKAFb9Yg+5sm+77323bavAcTJ1rjOW8tBAE51Skxwqnz3hETEO28Oy7b2zt
 +cl8kiA6FBklD1GW1kc0iFDzm2r/7F2hRO8EJPCzglsZ/LcBE1R/HG33ZCAalRs4MOyv
 UE5+VTAMirKeHTEAilH6mic081MBYHR2T9fUJ+FNDjf/vDLXTGE9cUd8hDEOwzcqEv9h
 1HZVpgru7g5i49N3KbyVVkux0fSMwNVTCe/QK4qsk4kVB+Bnv8YB88dBV/BQrVUkGbIP
 E3Lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD5BgK9+IsmU6eMEZpauSNzFWdONG/w3lviVhwjjcL8cBFKWWZumgHG53J6GFpWYZdaSG31FZIRQs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yym6gvfxl8rSg3b9/cAcg36zB4gv5glzbvVJ7Yw3Td0NLYzQAzE
 divi8ibDeVECqjMP4St3M8EC+ZwDELSsnRqCmVqFnjl/lnLDE9ZnzugiUe6SAQY=
X-Gm-Gg: ASbGncvvDUMA58brFwCklokkPYQJqvrsWTy8xmuEhCujQm5JdPhB6MwtSu1Z6VIxOGd
 njZKnqOq9rfKUhq1xJFPGsaVVddRCnlKsHhXnvPxiPKkv1x0s3SQCIix6488S6o4aEjL/b90Lz3
 mrwC8PpaKMpNTyUM2KOh9jiLNlByEefgxH5E8xV0Hp+nI4sLWhz1ia5bp4L7/6+lP9dygoIVrvO
 2rTbnADFBWctGPdZG85C3DywgcnT7dDuBpEx9SXGaZaNjS9RflrZO012qd7ZVBm4tjTB1KkDqSg
 aEueul41XUiZ0Fy7tY0ixzgxUO2xoRAABQiw6pA8ja0mPYqDuw==
X-Google-Smtp-Source: AGHT+IFy4o0lL4wbVfv25BbUZiZprY5pePIQkrVcMtYcd0n6ALHYFSnKECFQ/9k22YMwYBQpC08ZKg==
X-Received: by 2002:a17:907:6d0c:b0:ac1:791c:1526 with SMTP id
 a640c23a62f3a-ac1791c1cd3mr169820066b.56.1740990270586; 
 Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-abf3f3bbfb3sm525674166b.77.2025.03.03.00.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 00:24:30 -0800 (PST)
Date: Mon, 3 Mar 2025 11:24:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Archit Taneja <architt@codeaurora.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>,
 cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RESEND] drm/msm/dpu: Delete a variable initialisation before a
 null pointer check in two functions
Message-ID: <ce9599fb-a798-4f22-b51a-3341e690f8bc@stanley.mountain>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <13566308-9a80-e4aa-f64e-978c02b1406d@web.de>
 <54c30a69-71cf-4582-9086-50eb0d39f273@web.de>
 <k7un3bjavyt4ogscgc7jn7thfobegaguqqiy7gtypmq6vq7zox@l4bsevbsjrud>
 <29b32b0d-312d-4848-9e26-9e5e76e527a7@stanley.mountain>
 <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12050afd-ab60-4bac-bd25-0c3cc925b38b@web.de>
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

On Mon, Mar 03, 2025 at 09:15:14AM +0100, Markus Elfring wrote:
> >>> The address of a data structure member was determined before
> >>> a corresponding null pointer check in the implementation of
> >>> the functions “dpu_hw_pp_enable_te” and “dpu_hw_pp_get_vsync_info”.
> >>>
> >>> Thus avoid the risk for undefined behaviour by removing extra
> >>> initialisations for the variable “c” (also because it was already
> >>> reassigned with the same value behind this pointer check).
> >
> > There is no undefined behavior here.
> Will any software development concerns evolve further also according to
> undesirable null pointer dereferences?
> https://wiki.sei.cmu.edu/confluence/display/c/EXP34-C.+Do+not+dereference+null+pointers
> 

It's not a NULL pointer dereference.  It's just pointer math.  It was
a common way to implement offsetof() before we had a builtin for that.

samples/bpf/test_lru_dist.c
# define offsetof(TYPE, MEMBER) ((size_t)&((TYPE *)0)->MEMBER)

regards,
dan carpenter
