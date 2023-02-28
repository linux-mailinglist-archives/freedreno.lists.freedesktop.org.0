Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA46A50A2
	for <lists+freedreno@lfdr.de>; Tue, 28 Feb 2023 02:25:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E8810E4A1;
	Tue, 28 Feb 2023 01:25:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BDF10E4E5
 for <freedreno@lists.freedesktop.org>; Tue, 28 Feb 2023 01:25:05 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i9so11108936lfc.6
 for <freedreno@lists.freedesktop.org>; Mon, 27 Feb 2023 17:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ghYbiuae4Giu+YY0fM4G+aB2s++oD+nzVOPNd25Xma4=;
 b=ZsNE9/X4m10iwSCMrF45bZNPFSRZQ4XC2BhOn+5am/qoDxM1N+MUMpIqxtyahf+Zdf
 Z2QTGpvwr3BkO5dpBpjzXq/jFtiS+bfmDcmyKBdMH9MaleR2/R4QuTKvscdD93fjYVZ2
 XFRIy4bU/FvS39m2fbfxas4tjymDj0EmH+qhvghhmhcuquWYcYZhfLgyHVEaFpIcAatG
 r4iI/3de3AjNEWUXONWJLYbya0WWdON5VXajSU9XNpVv3vi44+ya3zEp9pSuah1Os713
 Qaw6IfL32ckKBryHSL1ZM3+/RFT9zLRjNgbMzTb8WMu/tLiF/Vf1Hr9DYkmhHfO/Ytd+
 OlGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ghYbiuae4Giu+YY0fM4G+aB2s++oD+nzVOPNd25Xma4=;
 b=oTKgJ3/Oa58pAZ+YcU0d1pOLw+tqYv6Ullho8qs6+cpnFtGe9SPwqeUuN2jtYg9oLf
 lrUQtJQ8m5UpE6F3Crt06eyv4wTddvgw8i7jvcfRE1MokYGq9SyU6LaBx9YAF8rS4v/U
 VWHgz+DMv50jJ1yWz+I8ZTAIMbyIVjaB20tRQ0mWQk6CLseDzzO4Cgc8nHjlQ9fsHbzl
 e0Kht0W/F7gVJZ0NlDUrE6pgssDOY1lPWo8BYqbXa8UIpuruvH68TwhWv5ivT+hy+i+I
 JgIB4KTvcYlp5Ni9MaqOCLlaYfzp35zSkruJtVrCzZa209JlBFi+3eLOgEMwtI/EWLEm
 hcsg==
X-Gm-Message-State: AO0yUKXwT/BLRbHZwbr/j/PJCeW7zzq1aZtnTGKHB2t5HIPGg2eDmexC
 cBrHskVHMGASfwheLBAiVIeXGw==
X-Google-Smtp-Source: AK7set9Roec5f/bQctSsNwIs9OaAY+Pi+BG6vxc3tJornTJbXlbPWDeaF84mA+daLoyX75ZJopcF6Q==
X-Received: by 2002:a19:f610:0:b0:4db:5122:2099 with SMTP id
 x16-20020a19f610000000b004db51222099mr128874lfe.32.1677547503901; 
 Mon, 27 Feb 2023 17:25:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056512024a00b004db3890cb4bsm1114243lfo.94.2023.02.27.17.25.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 17:25:03 -0800 (PST)
Message-ID: <259334b9-b255-004a-9772-8b252579a37c@linaro.org>
Date: Tue, 28 Feb 2023 03:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-GB
To: Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230131141756.RFT.v2.1.I723a3761d57ea60c5dd754c144aed6c3b2ea6f5a@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFT PATCH v2 1/3] drm/bridge: tc358762: Set
 pre_enable_prev_first
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
Cc: freedreno@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/02/2023 00:18, Douglas Anderson wrote:
> Set the "pre_enable_prev_first" as provided by commit 4fb912e5e190
> ("drm/bridge: Introduce pre_enable_prev_first to alter bridge init
> order"). This should allow us to revert commit ec7981e6c614
> ("drm/msm/dsi: don't powerup at modeset time for parade-ps8640") and
> commit 7d8e9a90509f ("drm/msm/dsi: move DSI host powerup to modeset
> time").
> 
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

