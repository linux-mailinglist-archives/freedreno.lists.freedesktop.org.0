Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DBBA65AAB0
	for <lists+freedreno@lfdr.de>; Sun,  1 Jan 2023 17:38:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27F2910E07B;
	Sun,  1 Jan 2023 16:38:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1066210E074;
 Sun,  1 Jan 2023 16:38:39 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id d9so10280595pll.9;
 Sun, 01 Jan 2023 08:38:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mc1B01KqzevdpjMajtl5h9LEaPSHWJodP26+oaFdvjY=;
 b=NzLcuMT+b0jS961KhEJ1C1zDTTzqTYi99bOLgRL4OZGrP9xQbDvaf68yTHafQZlclP
 B/1+E1mQTIftHVenpY0PhVG5+oTGc56vtBO8W/QXJSPKAgeDxwKRAOqY+ob/6J4yRbRS
 JgA6LrqsIKFyH70HjLcmDwu4QopPzxk5UwMSKkVnColc1rsssOyq+g+VwNStAXa1Y/d0
 AU1WrCSXmYLu9xyzAzBRi2ScJc4Ed9u2qwPnK5uIUHoBeE7KP6LNo4D6TrQLt4zAjVW2
 8EjUtHv9L6Dj032W9jVWd6xvpD2rz5sZ68M0t+/IJ/wuQiNimcFqITG8rIE2Nqn9Tt8d
 G8Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mc1B01KqzevdpjMajtl5h9LEaPSHWJodP26+oaFdvjY=;
 b=t8kduE5y8yCSGkI7GYkdEvulVhUChxXG+DnUi+BzHyzX4m+7XGcwl8z65JkE0ZUDTT
 1gPv6wrCAc4teipz4wXc+ruLcO3yjxVAQZ4i1PNI0eUjEKxPcxcKd6kx2FJtrpqqjCdM
 G0M5QbO7uE/9oTufdHPY67Dk5yT9MSWlgOOr2LhsrCtjH8RxpRHEfyXbUrULG6cnpfLF
 mPYs4r1Mu8xo7zMJ/opEQoQk1ZrsH6ybTyp/w4I4zWr8kkAEe55SIfMWss3ck3DKkAQM
 OgZ7tpKU7eVk8hQVDn3WXOocLC2JMERsQWTRv+Jk0kiDwk1U+ArnCAXlisYWUj52Ha45
 B+qA==
X-Gm-Message-State: AFqh2kplX8W9sUv0paa9NClEAz0yuTdxJ0J7L3LPggFW2kEuPxFxiC6z
 5szA6EyeZKqTBfbyyvPqZOamNKkqMr1WGIB1t0M=
X-Google-Smtp-Source: AMrXdXsFcuynzTuoqvgMSmOPPfD3wVAIAf22r64mLHGun8npzl6PdxsjZ6qsHsjy+WMJbPZEMDyek7kI/qcqiyV1W/4=
X-Received: by 2002:a17:90b:485:b0:219:720c:29cb with SMTP id
 bh5-20020a17090b048500b00219720c29cbmr3673388pjb.76.1672591119460; Sun, 01
 Jan 2023 08:38:39 -0800 (PST)
MIME-Version: 1.0
References: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230101155753.779176-1-dmitry.baryshkov@linaro.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Sun, 1 Jan 2023 13:38:28 -0300
Message-ID: <CAOMZO5AaZrXe8w7XhzG5LzCxdodOde-5ACV6Kgd8B+uYneKxWA@mail.gmail.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/a2xx: support loading legacy (iMX)
 firmware
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
Cc: Jonathan Marek <jonathan@marek.ca>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Jan 1, 2023 at 12:58 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Support loading A200 firmware generated from the iMX firmware header
> files. The firmware lacks protection support, however it allows GPU to
> function properly while using the firmware files with clear license
> which allows redistribution.

Could you please share more details as to what firmware you are using
with the i.MX53?

Is it available on the linux-firmare repository?

Please advise.
