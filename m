Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4839B9F38FC
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 19:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E5910E766;
	Mon, 16 Dec 2024 18:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="GSFukEQT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com
 [IPv6:2607:f8b0:4864:20::112a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39AB10E765
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 18:30:21 +0000 (UTC)
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-6efa5bf5202so32624717b3.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 10:30:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373821; x=1734978621;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=jnwuGVyAOEKZ320Va8tOKK5N6yh3orOqh3vNUx1y0RM=;
 b=GSFukEQTnJkEIAhNq+7u+Tv4x8IrqbozkzmPwNYMjsv7nvOf6+Ku8iEMWMtx+kbUpF
 I5XlJvp6bu9SS8SdI8JqMFjz8nTHAKxj1qXbLy+WsJu79C2tNKYegqMIoEipFXljzVdW
 9vMsRWtAInZSbJEkIrgFKfHL4C+d5PQ01pMw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373821; x=1734978621;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jnwuGVyAOEKZ320Va8tOKK5N6yh3orOqh3vNUx1y0RM=;
 b=RMh+7pLc6+6hj63lfwWL/SW4nkYFTZiwjyFhfy456mxHD7o7YHvWsa/ReqFnupaQnH
 e2J71ujJK9YG0axPayrBohoLK+Ekm4iH9GjViliITCrXpMM/VR4ECZR8dybgwoE/Z1+S
 KBQHkJeZDOoloZDKEiCOKRKwTXyDdqFrPXp77TcrYwYqRwkub0ZGWck+9KYpdwaMFv+7
 +PwrjTKho8NrIHmh9Xtus/3XgnvQXc3FhM7Jjh4BEzGPRZ4wXxm1zOKFhEYQ9SBJ07XE
 NJ5ajU+CMRlWMsqTKPpf6w1xEsLO+EUb+5dEB/KRkdZ/VKIc1jVrfcMht3lvlSlZMMWm
 7tCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtpbRQor+5q2Wcjxh6MSXkV3mjE3Sb0SA1SqWvt2ldt+1vlryObpOU4wQZN5t6/ppAZzlBE1ANr/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA8SXZIDUOuW/m9AZ/l+21ip/YR0qBxYhqf3sAnLzCEy4NHgtw
 vtCe/Gg8PdzhcCuwzksNAKnnI0CPccCfn4CkaOcU2XklRsCXU2vThL2aa/oebQkl6rygn5pJahC
 4dE/oEcxZbXJp0DRh2BTE9bGpBfxci4CeJRTi
X-Gm-Gg: ASbGncutLWHlgKhXckt9UMh5vDm+FSfN5FI0PWaHQDppoLQWGHgmmsKiw6HQqgfI0jw
 8L5BNff+fo03pU+jIlh3U4ebx8ouBOPtLplH8Rn3HlqCuNBgKwkA89rFhmHVRiMbZbQ==
X-Google-Smtp-Source: AGHT+IGAZ9GP/e8joq93AJgn9vGXh5Tq52Geg2Bjs8/hq7LhWnPC5AAAAbSev0Vk3ryNjuoLA19eOKXVMbQsxPH64mI=
X-Received: by 2002:a05:690c:d95:b0:6ef:58f9:4c0d with SMTP id
 00721157ae682-6f279b9e06amr99061537b3.39.1734373820988; Mon, 16 Dec 2024
 10:30:20 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 12:30:20 -0600
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-16-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-16-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 12:30:20 -0600
Message-ID: <CAE-0n50i1nLrBAgOdcc4aW40O1Bxd_N7fgrK2jCZqOFbMosAug@mail.gmail.com>
Subject: Re: [PATCH v4 16/16] drm/msm/dp: drop the msm_dp_catalog module
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Paloma Arellano <quic_parellan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Simona Vetter <simona@ffwll.ch>
Cc: Douglas Anderson <dianders@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:21)
> Now as the msm_dp_catalog module became nearly empty, drop it, accessing
> registers directly from the corresponding submodules.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
