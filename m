Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 860C78AB13D
	for <lists+freedreno@lfdr.de>; Fri, 19 Apr 2024 17:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0494910E405;
	Fri, 19 Apr 2024 15:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zibTBwUT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9508010E417
 for <freedreno@lists.freedesktop.org>; Fri, 19 Apr 2024 15:03:12 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-516d6e23253so2587982e87.1
 for <freedreno@lists.freedesktop.org>; Fri, 19 Apr 2024 08:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713538991; x=1714143791; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vJfnYZByoznqV4E5LwTYL8ExQfIwOVzSYp6IyIU3pkk=;
 b=zibTBwUTyTXu0qf0yJCW5lh0yV7Kz1AmKcBSa7IDclH4IJHx5yNuRZOJDAYPHdm2ya
 j3wHMecQoU7oeK3LiImF2NyVVoDlcbBXN4QSwSCbcjR00WTiGWjyds35JqodWzmWgf8w
 wBGKNlDILgPGfxIfLcWWuSOvLZ4K+KNLeWpmZiI+hxwG0N+j1ihx0YzW4t8bhHKtv4mg
 mfCNyDsPs/vujTgwgW8LbhVbqJQ1bGI/QD74DdJzuy0a3qTbUwWTyCuYqVDvG+ss11ac
 tVfgQESmjsCW/a0FvflvZ5fYO3RjRmwy4Q4BRRQIho4hLjudFAr7KD2nzVznxJYAhwMc
 iRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713538991; x=1714143791;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vJfnYZByoznqV4E5LwTYL8ExQfIwOVzSYp6IyIU3pkk=;
 b=COSjtvJVCGIoXSNsxULUyMNq+CG5/jj60Jm1kF+9Q47H8Kk1xyoHkh4kwhf4bFnmyJ
 UQ+nj3ld8CsDMvLyfp6E8yNh08yLVfeAmHhe1z8v1gc6i9Iq5Xil30X3zgs8uD9OAdeq
 FVI/H+XoGQeTw6u2yE92MPYDmYJXFhPQ5PRpa+fVuJlsZLjKptj6DYX3V6NqZ1wl6E63
 QQ87SOU9yBSo2McEscdAe4Ilfd6lBIStFK7ovkHT5YsjfL0NGTFSP0uS/LbsTgOUT6W7
 eYCCqEMH7WpEsQFcggy88F1dCQfeOOl1N0JNX9fVHI/caH3eIP7ZPywBnfAylxz1fgOG
 qFcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPmbYl+Ffb/bH3tnHmzfamQN+fbwvXkPi1VVX2wpwkToWY0eSqHdZuvzcQwtw1c55feC4zVwCEzDfgQtOO4p+htI+Hdf3li1/ABFuZo/ss
X-Gm-Message-State: AOJu0YwcO+xJCT88oPyI4aOq+hkWNatrS8vP9/Lf/NamkAH9Mrf4e0Mw
 DsBvkPS8iygPVnWJHvwm31vfWP+DCUnJ5AWWWN3F8fEQj2BJgrM5BQA/BOy4A/M=
X-Google-Smtp-Source: AGHT+IHwq2o3uW4PSBY4kcgDT3W2C9YBTiK8FKFdrI3qyLtn31Z5RjDG0xyVaYRX8cnMM1wh1zOKMg==
X-Received: by 2002:ac2:52bb:0:b0:515:ab7f:b13e with SMTP id
 r27-20020ac252bb000000b00515ab7fb13emr1993365lfm.33.1713538990549; 
 Fri, 19 Apr 2024 08:03:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::8a5])
 by smtp.gmail.com with ESMTPSA id
 f5-20020ac251a5000000b00516c077a312sm735082lfk.308.2024.04.19.08.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 08:03:10 -0700 (PDT)
Date: Fri, 19 Apr 2024 18:03:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm: Fix gen_header.py for older python3 versions
Message-ID: <ggnnlu67nsc7szqj2ndvmwtrbuyk3by2ja6ytcsr45q3tswvio@ehgbpnyxmvyz>
References: <20240412165407.42163-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412165407.42163-1-jonathanh@nvidia.com>
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

On Fri, Apr 12, 2024 at 05:54:07PM +0100, Jon Hunter wrote:
> The gen_header.py script is failing for older versions of python3 such
> as python 3.5. Two issues observed with python 3.5 are ...
> 
>  1. Python 3 versions prior to 3.6 do not support the f-string format.
>  2. Early python 3 versions do not support the 'required' argument for
>     the argparse add_subparsers().
> 
> Fix both of the above so that older versions of python 3 still work.
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
