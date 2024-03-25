Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A302188B27A
	for <lists+freedreno@lfdr.de>; Mon, 25 Mar 2024 22:16:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ED610E975;
	Mon, 25 Mar 2024 21:16:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="GvXkDAEd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83CF610E975
 for <freedreno@lists.freedesktop.org>; Mon, 25 Mar 2024 21:16:43 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc742543119so4559924276.0
 for <freedreno@lists.freedesktop.org>; Mon, 25 Mar 2024 14:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711401402; x=1712006202; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=A8IFRn6aSsHl1VGtupM1OXfTkfRMf//PoRLv8D0xq6c=;
 b=GvXkDAEdXHog9HdmP6TJqi2o0G4shpHqq2Ugr8zzDZIk/4e4DQJ3InYV1QucXjbrfO
 XzX4M9iJV4NEKWRMq4Nk0i3TVNiyhIIDhZAg0qpO3J0Pc/ETMoPq4olnoSDMFXNmve9f
 /wJWYzaxyAt2D9FNl4GSAW9gWLQ6BUMOQuPGtPEUTMVXt7t/BENcs3pbHJNr1s+DgEKE
 dztckC4BoJud74EdWDO1UGaZXJrXuvV2oefdHwrbko3oUa2cKe/VcrtEWnlrIbMlvDCl
 7XBqbl52nlmmpLkx3p8Vkx7tNursUuXTLZamQE/tH0qEUUFCbbtaAo/hTEcmEUf+8bVq
 XLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711401402; x=1712006202;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A8IFRn6aSsHl1VGtupM1OXfTkfRMf//PoRLv8D0xq6c=;
 b=Qt+YVvzGKmF499flnEAn7uZccGe0nmzyfrNApE/RBE4dHR6Ty6KLYIBjJlNp1Gr/76
 pT3nz7UjLUaTrUVESRreOfDjaFW6Y2B7BBp2Eng82+IaM4pp1vX8/aMEQSLRN/OrTaHf
 inNWYLBgjFOs+O6VSqTJ2bQRLRfHDbXj2iECPg511MtP/+RE85cUqIEgedl66DQSPne4
 mJZg9H2nuL+OK8//48xwg3op1d0MNvfnaeWhi/Cjr4RqB0w639+PKzPPaMa7EFEfdAS3
 iIDanz++Nv87dXFd8SKTQ88wR7SFUXDT/lsO6McnqjVYl82DblMggRSmp2XpmpFbZhH7
 QQ2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVl+mQVom5XgdZGn3/RnX6QJg7MJAAwC7Xwlg1j8y0M8fLVl6fqNIuSv5vjXe8LuDQLBP1foNLPZxXdFFnXw1Yh1t45vYBqZd50yughBxAR
X-Gm-Message-State: AOJu0YxBcmyv7fK/5Q038BmaJEDaeSJDcsm7Kym79WoKMJL0trANCnwT
 b1/vRVqIVizMENEMBfGIa+wHxEfJ1GmdCO1sVOasP4ljQD6jMKFYQ2co1ngTHaO7+X9xxbK9N0O
 ub9g3r9nSIqfKiLuF5n2pb5UUBEejGJV1pbNCiw==
X-Google-Smtp-Source: AGHT+IGmfJuEEZK0xXYu1atPPd7gdTrXAHTMAqXWgAFibdrfnqzHArI0XM86kbZ4hMgAFB1mDKzR3VsuVkcuM2xu2sk=
X-Received: by 2002:a25:a1c5:0:b0:dcc:52dc:deb5 with SMTP id
 a63-20020a25a1c5000000b00dcc52dcdeb5mr5391964ybi.20.1711401402341; Mon, 25
 Mar 2024 14:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240325210810.1340820-1-swboyd@chromium.org>
In-Reply-To: <20240325210810.1340820-1-swboyd@chromium.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 25 Mar 2024 23:16:31 +0200
Message-ID: <CAA8EJppFc7+ca1JA9cbtAEV3+Ln6BoTkzdqyq88_gfN+m9fiPQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Add newlines to some debug prints
To: Stephen Boyd <swboyd@chromium.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
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

On Mon, 25 Mar 2024 at 23:08, Stephen Boyd <swboyd@chromium.org> wrote:
>
> These debug prints are missing newlines, leading to multiple messages
> being printed on one line and hard to read logs. Add newlines to have
> the debug prints on separate lines. The DBG macro used to add a newline,
> but I missed that while migrating to drm_dbg wrappers.
>
> Fixes: 7cb017db1896 ("drm/msm: Move FB debug prints to drm_dbg_state()")
> Fixes: 721c6e0c6aed ("drm/msm: Move vblank debug prints to drm_dbg_vbl()")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/gpu/drm/msm/msm_fb.c  | 6 +++---
>  drivers/gpu/drm/msm/msm_kms.c | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)

-- 
With best wishes
Dmitry
