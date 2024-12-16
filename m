Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA019F38F4
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 19:29:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07B610E75F;
	Mon, 16 Dec 2024 18:29:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Lrp39gUs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F390110E75F
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 18:29:26 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-6ef6ffcc2dcso37578137b3.1
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 10:29:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1734373766; x=1734978566;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
 b=Lrp39gUsXVc0402ZcG84uyI2Dm4oHIXIGtoZLUstCNmeK5zAB7O00KP1a47DMLs9I4
 aXfdKMwiE74f4JrV/f3mKt9AcVZrGTpETK2GeMIGKba64dc3eJv3sFWUos1+kFf+K5N4
 k6sSDD0AhE5Cx7Q4qT93TinDkJ8fB7uTVKpfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734373766; x=1734978566;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GR1waToDgrCuopV4sJNgGblNy716dPbxfdvbcwPcWso=;
 b=YgK9qtMyUelrlx7jRIGYVwwoVJ6ymnTpWY0UOx1XDFgk6pwN5D63m3GJow5gMeVysY
 t6GooX0qqzVY6Kh8rzYsVfLBUFFEYWVLe6m3D7cTAJUj80cSyedqFUOOtwilA9dhH2Lb
 OEiEyzZlab3n9WWP3JEHHBXOkK+LqFxzY/zoH70MWcrL3xW+Ke+SWdLfCifgJNjGP5Eo
 xx8GQqvaS/hBUBazSQnpqHXJe9vP5hZHBdKOolprPpdMS05q6H78tghKP8wAyPPR51Sy
 XATzF2GT8CBQySTUthghJh9SknzTFk4Lo7N7KfNHhKWUvB4G6VXViBuTkBN0UMm2edNA
 FZsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW7Srdt+Wxx0kZPx+s/Yc3fcWXcC23hwKm/8ASMKFF3My9E94OxDZKhFMalIR5P3JcxaYkmo6qdNQM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVMRvSEV4KVowwjNERd191DH9aqz3njRVinzB2rpiTnWkQCD/K
 xmMEW9S9wke10LeOBuM4VoJLouc8CiZewWpYiw1a11JqDE5PPozx0FYGlOgTd19W5ynZ55tqX8+
 lyH+i2DULvYVop6hYSgJSMbxLqYCtdknNfNd9
X-Gm-Gg: ASbGncuGrolXHje1pRKIw7OVSG07I8YaEBeaVuFCgdaizxVcfKw3dHucpwiAAwbKlYR
 M7SgjBxvBdVdnro3q7wbMo2t8EsYaz7GnMOA3d7LSqPRXTawLPNK7V414qyK/YVt5WQ==
X-Google-Smtp-Source: AGHT+IH1rrCqzyUmv/+ovkxDTTujqBxDtcReQhBBlksOzIUEXVcbUlAtrkHnUp3TKKoOBpjZ9dyQODPY9A4b8x3dvxM=
X-Received: by 2002:a05:690c:48c9:b0:664:74cd:5548 with SMTP id
 00721157ae682-6f2bb9a5b62mr5055197b3.1.1734373766242; Mon, 16 Dec 2024
 10:29:26 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 16 Dec 2024 10:29:25 -0800
MIME-Version: 1.0
In-Reply-To: <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-6-f8d1961cf22f@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 16 Dec 2024 10:29:25 -0800
Message-ID: <CAE-0n527-TKS2Y=SsmALOKrx_QrzT4=j_dTyNgk9A_RDQzVcWg@mail.gmail.com>
Subject: Re: [PATCH v4 06/16] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
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

Quoting Dmitry Baryshkov (2024-12-15 14:44:11)
> It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
> driver gets DSC support, it will handle that register in other places
> too. Split a call to write 0x0 to that register to a separate function.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
