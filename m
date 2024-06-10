Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCDF901B43
	for <lists+freedreno@lfdr.de>; Mon, 10 Jun 2024 08:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A5D10E2D1;
	Mon, 10 Jun 2024 06:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nn2zxkYh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
 [209.85.208.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB89E10E09C
 for <freedreno@lists.freedesktop.org>; Mon, 10 Jun 2024 06:31:32 +0000 (UTC)
Received: by mail-lj1-f174.google.com with SMTP id
 38308e7fff4ca-2ebe3bac6c6so8863601fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 09 Jun 2024 23:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718001091; x=1718605891; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=0foBbzkj/yZAJLvDMQGWe5daB0oiOZ9HEzG6T9Jt6MY=;
 b=nn2zxkYh46Lpp1qqSlPzUaynW6NSr3R+HVUkLe7fwjhDbi5KwBxhwRsLrBUqd3QIXV
 cGaxcIRuInVYIrXBBmxBiqc6iDgYqxgSy0Pi/vw4K/m1wjsgCpMUWktqCRhFSBygPewJ
 ChrrMpfXtPuPMYX/Yg6vsoDA4OshaMxt6WTilsgHNDAzW9+bTN3ke6WTCewAnV3uq1aV
 4QpgYg0ODcPmn3jCol9vv3zs5OoRpjYqhk/RSCb28HhCd3BOV9HGMxx8PoLWqJbnlhWb
 2nf4v/iUlmxe+d3YVT0yg2Jsv435qH5mAtOAhp36CSvmfgCZBA5rac8Yzp/vxOvM2rCl
 au6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718001091; x=1718605891;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0foBbzkj/yZAJLvDMQGWe5daB0oiOZ9HEzG6T9Jt6MY=;
 b=JoiGHE412AGvONtyugamOWiZD7msecfQGuZTHF293DkwZrMMoqytUV7c5cxLSYlGSf
 oMw0qk9gTctx7V1Mggkee2j+EFcl4I/nmeu1YJh0JLXLczAIrJs2R/nQBWX7eHMJX1NV
 p98peKglh43EFsxop1i5z1BD4lbLVaLZFqVU49lfzbwdxRMLhSYcej/bDzB1pCLZ9lWb
 670J6Qn8Gu0yPEA9Kcnx0B5QKDpuTPU8+6F1zfmlg7ZOIh864SJOWqBl6JyfUj1m51aY
 KLXV3ii5slAPhAq7T/kI6AZ6dMX18jQ/K/LbOr7TbIItXjHv0mxMr9n1vJTmp+xsg+Fr
 ZpZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgBWzcq5JGW+8fMXqfuQbkAO+QNDDahFh7I2RMWFrbbne7IhBAZFyP/TSQO1Rbsk3xt68YgvEg/9siWjT6qTtYDJRe/qdQJTUhkcG475cI
X-Gm-Message-State: AOJu0Yxeptiz6LgKXIC++8kBj4inV/QUpsaAMFzKmQ6u2Yt3HnWITaQk
 uhubezjZZ+CSpjyQMv0Vw84yFdVsJdwN1dYO3FomTEEfRetUP/d2Ziu7b04lt3c=
X-Google-Smtp-Source: AGHT+IEbjxnLFduuLjONOUTvHtbpIgLNsmw/X8E0xtaG1CKGLDAlODB+2oaqYGwqaaw0WtMBz4VOhA==
X-Received: by 2002:a05:651c:1042:b0:2eb:d5a9:40fd with SMTP id
 38308e7fff4ca-2ebd5a942d2mr39653051fa.53.1718001090636; 
 Sun, 09 Jun 2024 23:31:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ebe673fe28sm4103891fa.53.2024.06.09.23.31.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jun 2024 23:31:30 -0700 (PDT)
Date: Mon, 10 Jun 2024 09:31:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kiarash Hajian <kiarash8112hajian@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <oa62wijdvxhcoamynii2szxaxfmutkzup5djstgqzrfe4sjizu@vnz73mhhlgss>
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
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

On Sat, Jun 08, 2024 at 11:43:47AM -0400, Kiarash Hajian wrote:
> The driver's memory regions are currently just ioremap()ed, but not
> reserved through a request. That's not a bug, but having the request is
> a little more robust.
> 
> Implement the region-request through the corresponding managed
> devres-function.
> 
> Signed-off-by: Kiarash Hajian <kiarash8112hajian@gmail.com>
> ---
> Changes in v6:
>     -Fix compile error
>     -Link to v5: https://lore.kernel.org/all/20240607-memory-v1-1-8664f52fc2a1@gmail.com
> 
> Changes in v5:
>     - Fix error hanlding problems.
>     - Link to v4: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v4-1-3881a64088e6@gmail.com
>     
> Changes in v4:
>     - Combine v3 commits into a singel commit
>     - Link to v3: https://lore.kernel.org/r/20240512-msm-adreno-memory-region-v3-0-0a728ad45010@gmail.com
>     
> Changes in v3:
>     - Remove redundant devm_iounmap calls, relying on devres for automatic resource cleanup.
>     
> Changes in v2:
>     - update the subject prefix to "drm/msm/a6xx:", to match the majority of other changes to this file.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 33 +++++++++++----------------------
>  1 file changed, 11 insertions(+), 22 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
