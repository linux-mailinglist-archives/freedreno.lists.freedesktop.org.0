Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89CBEAA03BE
	for <lists+freedreno@lfdr.de>; Tue, 29 Apr 2025 08:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5081110E2E1;
	Tue, 29 Apr 2025 06:52:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="omZEAMMF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0267510E2F4
 for <freedreno@lists.freedesktop.org>; Tue, 29 Apr 2025 06:52:05 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-5f6214f189bso10880304a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Apr 2025 23:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1745909524; x=1746514324; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=V3SRrGXA1KOeX3Qp91hES8MKpl0kNS1RThpoZDWoOdY=;
 b=omZEAMMFNd5qE2reYyEjswvyiZv+MKxzcvRKl108UN8MMT1Hhnfz25kmrjmCaaFYEn
 isf/AX+wexJW4lNT0Nl2tSV4ufHklNuUFT3EKf+Wn4OiXC4DdZ7Fpq5mEHVuLOnQMZGK
 8RljRDdhXeko9G7KTtX7HC8aUs4FV5wslmoprpOKqrUHcUJQnTEtGiG5+VQkAT8cr5bg
 wpinN3tbZ/GHPfdq73D7JDCHnj95sxI10CBNnrWpdD4lbFBKT9S3gLyUeAvDupOGxHYm
 LvL/wN7rLcwAybhUgo4+MeitXe2MhEH0/glbySIps3yjdP7mUcSFcLPv1UZSNr+XufUd
 VxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745909524; x=1746514324;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V3SRrGXA1KOeX3Qp91hES8MKpl0kNS1RThpoZDWoOdY=;
 b=fv6EvrVueU5KK1YxcOtrKf+nUE1DTS0uHE1k1WbtYx0AOyUI64+r/hqtcl59XhbPrR
 HoOVfRbh5etDrwJlFjMjFD3Ie1UxEnVXcQKMKaj/vjsv1vZICbAP0Y29DBrp9yR/iL3F
 gLFa//JkOKWMc3p9Wp3Zlg5c3B3sUk0DkdsUGbjjNPcyTUvYghTLHGp0pcqtRXvRPjbY
 /Bx/O0rGgFFo7xFzZ2i9XL7A+mAU4tBW+yYwWVrg8lW/8AAI+UALx8H8RcLpypwNmdO4
 KVh9SIy2cijqk+f2KXd7SahLSaa2bm+xjzxGIdaZ5QyqGUyBcP+1X1LyXPTLuDSiaiKE
 pH4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgZG2YDkqCC4ofS6PBB5edW0CPBwBkBRX7fLFNkz0KDFWLEDnc6lOiabV62gPMUWfCtn6GRlLqj/U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0XFEpeczy2kyBP5e7E+sPF5vU5uz/QAq5d5QdbYlfDcgjabeV
 W1F/5VsPfHTI6plGwCfW2iodS/vu4bKz8PHqX3Q8RZM8TPD4z1Zvt7RoCkWtKHs=
X-Gm-Gg: ASbGnctGVrPAEhPpJAWIHZBb/iyExmRW5FoIshvEXEqFcPePt2ZUWgS2PTBqm7lAajo
 99FRgyeU35U0zY9Askk5cXyPOEss9XdOILhzHBL79T9cLDFQ2LLNXjethdOrEc+G1hl3y4jCPVU
 FgT5ees7zPOXBdZUHonzX0dXq2YvessvcGfUiBr9s/K1bein6vFBPc7jxx3mNUQHrWp8mmK/K4x
 lsaQcOUFWjzEe8v487PZa9mWePUNrOOfvfw8gxL0ABa5CitUqjN6Jd77an0sNWyAVs7FipKZzEu
 g1mvYCs9fPLYImrNDfW9sdZt34BPf/ZLj09Qlg==
X-Google-Smtp-Source: AGHT+IE5A3qZWFdKlz6u8IXcMu/YWdgZDamp5pMVUAdRD0eLvFFABY5HqL1f0Ebisd5cUwFYaxMYbw==
X-Received: by 2002:a05:6402:2707:b0:5f6:c5e3:faa5 with SMTP id
 4fb4d7f45d1cf-5f83b2561f8mr1335517a12.23.1745909524457; 
 Mon, 28 Apr 2025 23:52:04 -0700 (PDT)
Received: from linaro.org ([62.231.96.41]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f701400565sm7082545a12.26.2025.04.28.23.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Apr 2025 23:52:03 -0700 (PDT)
Date: Tue, 29 Apr 2025 09:52:02 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Johan Hovold <johan@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 laurentiu.tudor1@dell.com
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
Message-ID: <aBB3ElgEoCF6yYNY@linaro.org>
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com>
 <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com>
 <aA+N8YHX0DZ6h9Uj@linaro.org>
 <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXpG-1AP7qP6bAfFcdxtDxsC+_3TYFqwByp5pkFiRYvmJQ@mail.gmail.com>
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

On 25-04-28 20:23:45, Aleksandrs Vinarskis wrote:
> On Mon, 28 Apr 2025 at 16:17, Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > The change itself makes sense though and I think makes sense to be marked as a fix.
> 
> Just to confirm, you mean to mark as fix only the 1st patch, correct?
> Since it's obvious now that the currently present partial LTTPR
> support did not break anything that used to work.

Well, the way I see it, the LTTPR support is broken on some specific
docks, even if it works in most cases. And since this fix improves
the already working cases and fixes broken ones, yes, add the Fixes tag
to the 1st patch only.

I'd even send that first patch separately to ease the merging, but that's
probably just me.

> 
> Thanks,
> Alex
> 

Abel
