Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E94D5E62
	for <lists+freedreno@lfdr.de>; Fri, 11 Mar 2022 10:26:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2377710E7E7;
	Fri, 11 Mar 2022 09:26:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847D810E7E7;
 Fri, 11 Mar 2022 09:26:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4EB961F46323
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646990806;
 bh=VrFTl14kcVqcYYACUB4vzGhspKA0SIhAgvXA9pmJvX4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wt65MNKN9/56BVKEQ7gs6zGHjV4yVDE4WPD3sfXznCU8tFdO1RdwKYhcI1jW9bYYU
 tQaIkTQxQl5NrPQQUYeRMGZbV1a5SVUD77O593lhzpy5tNhzr4jaVl6VvgckqoPkAD
 HcoVkRKxBWJNiKlq3zMW5wvn52SDcAtw6Htb6D/FUyOzKQwVCbR0qW6aE3QnYL7il+
 68MmKGoGxW7jQNpbDybZQ4bwrgfOJqFqiprBLhVgZTjWlkfVaaUEkhin5dXzkeP947
 1JYUW6mcU9XI1iW5Hbk2JcZvmRqRevLrHKDBW9atoLf84+r9gEbJe0kGra1rxgvHeT
 NLxleKWo/UaRA==
Message-ID: <c4ff9715-f390-0adb-cee6-1812d7308cb4@collabora.com>
Date: Fri, 11 Mar 2022 10:26:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220310234611.424743-1-robdclark@gmail.com>
 <20220310234611.424743-2-robdclark@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220310234611.424743-2-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/gpu: Rename runtime
 suspend/resume functions
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Il 11/03/22 00:46, Rob Clark ha scritto:
> From: Rob Clark <robdclark@chromium.org>
> 

Hey Rob,
looks like you've somehow lost the commit description on this one!

Cheers,
Angelo

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   drivers/gpu/drm/msm/adreno/adreno_device.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
