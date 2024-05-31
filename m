Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 327E38D5C9C
	for <lists+freedreno@lfdr.de>; Fri, 31 May 2024 10:19:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4582F1127CE;
	Fri, 31 May 2024 08:19:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RKCpivam";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 721A3112298
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 08:19:19 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52b894021cbso425593e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 31 May 2024 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717143557; x=1717748357; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
 b=RKCpivam9F0sfMiSm24btR/npsYAT9iUbsgQc4Qoy/45vRAmzwejHHXrMDkPP7Kcf2
 Ra6iRZjGMvF1/+/r1fzwcfuBe+J11ZuvcWbKdxxphQIrcc0Igf57a6+Nvl7YmswwWXmg
 cthtQQgKAyFAoP+TcFRJEMxpR6CBYJACFwz7NRlqMnvKIq0DuE9dw3uVKqg3MpxrrZ7F
 EYQkf1EAgKlykXbBRZwGMJVMyBxAfyRkAKl22VgX9Av/n1ccR8m1AdwDs216lA6fvGTt
 D3lePn5Z9ithkEMuNy1PLJyVQ95iTMc0seg7JZB/rc7jpLJFNYIGzawi+9BREK4GTbks
 0eXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717143557; x=1717748357;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
 b=O+ZVXi8EOQxHZ3/fyh7KGju3hSDje7p6unI6KMyIH1/1Rka7lVuWEcQpwPYpjKr2GC
 oQeoKNAMHb8ALM3ddkmAgmjsnuLtmaMCaXMpvYWBloCeJ4KwcczqcJT1QmgdBuxP+fN4
 5s8sSpqh+g2++5rbu6JOlaoEYwSEWfyUS/+khXLS990HMp/TIY+v5aAfbTWa9Pd9whr1
 1addNw7wTZrlWs/7Eh/1Qf5MjQmHp99M+PQept+qkfsht40a+ZhPxpfsH559fFOBY1oi
 Ct1JWo7e1dQjWF8dUVUBV6eunVLcCJLy0ZpttQaBEOcN0GAkDz0CjhtO/f3BJf6sr8qO
 MW7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHIGpRXNFAE+7lZyZsx6hCM5+u7lj7I1wtFjRJ7Z2PrjyVD5eKR/gPrgrGUgy8aY2n+wQqToDROWribMadtCnpsFZGB7bkVcwPiVNjuV6i
X-Gm-Message-State: AOJu0YymAN0f+atqZZmFcUTnJAu+RAOs2D03BBcat99DIWIbF7qxC6dY
 WeI8P/X/Is++07iZtHvmCg3hqMjyUAhlUBRDFmQkxQipPSwXkcGIfqbb3EqP3TY1fBESmFp5Yzm
 B
X-Google-Smtp-Source: AGHT+IHKOALBvpP5h0AiQmZTmJVgPq3q/lJ+YsJBLy9b7uGY4oRPAaR9D6pdKC0bm/RzqJYNRG+OLg==
X-Received: by 2002:a05:6512:70:b0:523:9789:4c8b with SMTP id
 2adb3069b0e04-52b8957ff6cmr664063e87.5.1717143557411; 
 Fri, 31 May 2024 01:19:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d3450bsm254800e87.45.2024.05.31.01.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 May 2024 01:19:17 -0700 (PDT)
Date: Fri, 31 May 2024 11:19:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <dz23snvzifgjc5dktv7sckkumpudjkumf65bc66eler3xm4atf@37nypjcwyxef>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
 <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
 <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
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

On Fri, May 31, 2024 at 09:33:12AM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
> 
> On Thu, May 30, 2024 at 7:07 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > Alternatively, maybe Kconfig could be taught about build dependencies?
> 
> git grep "depends on \$(" -- "*Kconf*"
> 

I'd rather not do that. The driver option disappearing just because the
pythong vesion is incorrect might be misleading to the users. Anyway,
with the Abhinav's patch the issue should be fixed (and I'll take care
not to break it again). Sorry for all the troubles.

-- 
With best wishes
Dmitry
