Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 542AF9ED99E
	for <lists+freedreno@lfdr.de>; Wed, 11 Dec 2024 23:26:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6244F10EC3C;
	Wed, 11 Dec 2024 22:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="nqHXuctD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA05610E138
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 22:26:23 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id
 af79cd13be357-7b6e8814842so1970485a.0
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 14:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1733955982; x=1734560782;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:from:to:cc:subject:date:message-id
 :reply-to; bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
 b=nqHXuctDT8hlIGtmDowe3z7VHrvXAWpxPs9d8QjV8uSGOxPNTSiqZdW0waWqrVbXVi
 AR3iX0kTiGvJHQhK8ntfwXG8FENy+KEY7Iepv0yaEomwCDgXGWsU8z6FWkZ1qf6T8JG+
 J4y0TsVvP+LRVZK3g5UOW/oId9JKzFw07hwao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733955982; x=1734560782;
 h=cc:to:subject:message-id:date:user-agent:from:references
 :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/M/xqt3HYEq8xu0qvRyIhfyiL/m77tfLGjHEA9e2rtQ=;
 b=Ze6IsTZK7g4Z39d4zF4td5PUZCt1zvQEeZZC7uSoOp2s5ai7kqbFA4cDXHZcvtoxcz
 xJSKlcuitKmxVX0lwII7hxLcyCRrOmTqYiOfhpBxm6xZ9/kF3YJlpqk/xNWdwfLimm0L
 79FQxc3P2RGjtiSze1fJqgHspE/VLWWW/S7Z/UlfL7TtqeI/NUpK1HLBPh5z4lxT5YYQ
 5Uxznh3/28fOiiAHmRQicF/RndS8SKJR3V32tlYMwB0xEUSQ1I5YNuSYMY/m0P9n6Fxv
 sf/3A0su7MB8eeAYFVz8aHzLSe3934a/T88HWznK/aZKHK3s54mygFtfXonlGae5fUnQ
 v5FQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpd2EuWN117cVe7LPdofK4QDWSGgBXUOj7yxZYFDP2xFLhdWcYQTkim3SHJChzKkjdKHBBN3IHKTs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbG/h1ktLAGNvinaLQDApIJKb6yY7SzAaGFlFtCPIJYeifWdsz
 qDmY7W67uBze5e8V79KIO66imiCW3rHiZvMO7n5IBtdGxjbgWuGQwgLl4jhUoIioPGk7O+OkPyr
 lhaiCHDtvXF76j/1V/ugOs4Dnrbrf8CWkW2gY
X-Gm-Gg: ASbGncs8507/GRVllmLnXbLWwi43Bl3VMHwZzYdxrUV7UQOltp5iNMWtJxt1gUhMc+F
 Cx2QthL9T/9mXhCbKNg5GZvw9qtzXuFUc+PetoJz0C88vNad5+Hc+q3NY6BFEPFA=
X-Google-Smtp-Source: AGHT+IG1XnoTiDslXI0cLjNa0JxPS1XzZXpqmwomEHJN72jbeseiTASByoXZoRuL5Gwb8j0Gd5R1nHZIPbm0MA4yihY=
X-Received: by 2002:ad4:5caa:0:b0:6d8:883b:142a with SMTP id
 6a1803df08f44-6dae38de1f2mr20414676d6.2.1733955982669; Wed, 11 Dec 2024
 14:26:22 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 11 Dec 2024 14:26:22 -0800
MIME-Version: 1.0
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-8-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
 <20241202-fd-dp-audio-fixup-v2-8-d9187ea96dad@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Wed, 11 Dec 2024 14:26:22 -0800
Message-ID: <CAE-0n524xYp30nsCh4+-N=dy8g3EuKTkwA5yXbOOXzMeHJztFw@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dp: move/inline panel related functions
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

Quoting Dmitry Baryshkov (2024-12-02 02:06:38)
> Move panel-related functions to dp_panel.c, following up the cleanup
> done by the rest of the submodules.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
