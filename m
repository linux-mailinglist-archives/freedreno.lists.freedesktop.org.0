Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8798503BB
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 10:45:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DE6E10F550;
	Sat, 10 Feb 2024 09:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NB0bxXSZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B6A10ED51
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 09:44:58 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dc74e70508aso1742316276.3
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707558297; x=1708163097; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wZ6CRidteOeNsDNsYH3R4IcXLfOLzQiLCa4L+raUHnI=;
 b=NB0bxXSZYEXDDf9O5TTnu9snExtBHVQEOvfXElxk4WUX/EuacsfsVRrCDB84leLNMq
 WugLBFSW1qXBNNAIEOWZw5e7bMFhIVqaTManVZcTJxokP1kLJk8BZXeHmTYghF3cyZxU
 sxNF/STh/CaZ3JGNlYVcrqJaffY3DOI5152hAP0P7zNZY3N6a0K1GnhqROM9YUce82ow
 PoQ4Zci+Wyyl2PLWavVTXrt6ea0ko9FwNvC9QzZsj3wGl1UNaliwO/WfchNFiN/+IHfW
 2Q8M/GhMP1PohDNUG86iIx8VjsLXlJhNIZ6tUoKpqQWmckwJ26FT+SIQgrsVmR7ZHf01
 2uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707558297; x=1708163097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wZ6CRidteOeNsDNsYH3R4IcXLfOLzQiLCa4L+raUHnI=;
 b=P9J7F1RngLXzKmsJy8fB8SeOTdDuD3gj1bZ5zafIUhc4/gWLNjf7IBvWPFe/VJ3E3e
 9oTcnT7AXrgfUj0SYA3jtOoyUchhfZogMMXUWm6dyEd8WU5BzJMV/914X/fK74zELQvc
 7uDKm8tfyNWyY30WwLiaezQ+ON0xqkIhWm9YnHixxLq+RVGtCJbcbrKKVHbru58Xi/eX
 g3BKRJ8Eueo/R2g+4VHB2f5dJXUPIGQkcR8Pg9DUk+djDBl8BlXOvBawagqBf8WxElld
 jHi5xhHf+Diw9024d1Gbi0tv64Q7m530wl+3slHxY/f8/r0XiX60Ds5gUPMsaOQ9VJcO
 3nhQ==
X-Gm-Message-State: AOJu0Yw5aFrfwe4QZP4dzyfqB7m0sUYeMCe5QiSRuU0aizLMLJrnOfDz
 Jaz4GyiScOqg0jWpqdnNPdX/UCDTlrCMg1AgHKqDgaWJZ9HxVMaeSAJepLMmtQWwLmBeBoswZHM
 m3TZL5k41IoX8YpogqogwOEUZLzr/JvbeBcPsng==
X-Google-Smtp-Source: AGHT+IF0eF6lGAv+TUyybyGNECGzCMVsbLQbS6zL7lEgkfBkLiiZ3utg1bX7sy4VZtcBLvZgXXa1fnVTapkwH3o8UVY=
X-Received: by 2002:a25:b89:0:b0:dc7:481f:f578 with SMTP id
 131-20020a250b89000000b00dc7481ff578mr1613461ybl.40.1707558297705; Sat, 10
 Feb 2024 01:44:57 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-11-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-11-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 11:44:47 +0200
Message-ID: <CAA8EJpoh3E0b_rNCN4drhB65_xkDN1QJhPLBHWouQaKOLBKCQA@mail.gmail.com>
Subject: Re: [PATCH v2 10/19] drm/msm/dp: program config ctrl for YUV420 over
 DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:53, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Change relevant DP controller related programming for YUV420 cases.
> Program the configuration control register to indicate YUV420.
>
> Changes in v2:
>         - Create a new patch only for configuration control programming
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>




-- 
With best wishes
Dmitry
