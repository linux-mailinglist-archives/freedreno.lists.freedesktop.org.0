Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A9B5F8DAB
	for <lists+freedreno@lfdr.de>; Sun,  9 Oct 2022 21:14:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FE110E521;
	Sun,  9 Oct 2022 19:14:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE81B10E521
 for <freedreno@lists.freedesktop.org>; Sun,  9 Oct 2022 19:14:18 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id d24so6912617ljl.9
 for <freedreno@lists.freedesktop.org>; Sun, 09 Oct 2022 12:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eLmKWVTMUSHqEP9DIVkRM+ZnS7XRFcavZfbEdhp8mMc=;
 b=D3znIKzXKwQaxB7Ox3lpizhW7NS6r19zfvTiJftlw02OF9QCPjt9kbEIllwQSDwAZm
 bbQd6AGAx4o2TTHo7hE884uCEcGqpp6G4Ny7jvmIBpXYmT2rwz0rUyxYHHYb6xXZLDHc
 E/DV8n9stU9dLyYaAgvDlJFsbnUibYlnZ3lQiZYIXY6gD7JTWs4L3E2890nEcjUZGl/p
 uegdz2Z11CjMAJ7dwVkfNE9BlNRrCClWYLW6o+2UaccXyf4zJIrbSLQt8/GNaAY2oQap
 k8xV2eGWsUXni6SEBMXVz/OEX8Xxc0HYD+ZcLhdkj1uBQdTp3VrXeNoO6jBsfp9PWNDD
 kUfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eLmKWVTMUSHqEP9DIVkRM+ZnS7XRFcavZfbEdhp8mMc=;
 b=QxDfYmviEMaA5uvgoVhEB6cE8HHAyosJMCu8yRG107AolEFSZ1P2w6R66P2oDUYfPa
 fMMMGHhk3wdpI3/BOWO28gzeqxva6qgzjbgNUQxkr4uzVcam6litRswsfGxMQYmpJdK7
 3mk3i97tuMM9BgFiOEgFP2TaRTvUu+HLwXRm4PrTYXiANNnHaa8SXMMcJZPGPrnU7bZ5
 QmeGpdAfN63L5h7W4mC2gMWDsYkY+qiQeYNiRvG03dOs4MNtsl1xqFdwIaSQe2PBhuwc
 xq5qZgHLJliY3cdvBkafzBbG0o0e+YMKzf0fGutr+VsQeJ71on8kzeHTdwemy8GG6l3e
 DRYw==
X-Gm-Message-State: ACrzQf01yNE2lOTUneT1qnAdFwRTNN79Z58/Om7utXmVFaaZPL6Pyuwh
 yfqOdBdZ2egSdEZiQ8eYF/xRUQ==
X-Google-Smtp-Source: AMsMyM4a9wjRAHNMLggg3ZrR/45pdnYmZIpeoXCdgpM946/5KOUGeLQrsUAwlMweZbXSn4hMmZKK0g==
X-Received: by 2002:a2e:a54b:0:b0:26c:72ed:b758 with SMTP id
 e11-20020a2ea54b000000b0026c72edb758mr5535281ljn.245.1665342857092; 
 Sun, 09 Oct 2022 12:14:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056512368e00b004946c3cf53fsm1117170lfs.59.2022.10.09.12.14.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Oct 2022 12:14:16 -0700 (PDT)
Message-ID: <408bf6a2-47fe-3eaf-7235-578d33a576c9@linaro.org>
Date: Sun, 9 Oct 2022 22:14:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-GB
To: Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org
References: <20221009184824.457416-1-marijn.suijten@somainline.org>
 <20221009185316.462522-3-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221009185316.462522-3-marijn.suijten@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 10/10] drm/msm/dsi: Prevent signed BPG
 offsets from bleeding into adjacent bits
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
Cc: Vinod Koul <vkoul@kernel.org>, Jami Kettunen <jami.kettunen@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 09/10/2022 21:53, Marijn Suijten wrote:
> The bpg_offset array contains negative BPG offsets which fill the full 8
> bits of a char thanks to two's complement: this however results in those
> bits bleeding into the next field when the value is packed into DSC PPS
> by the drm_dsc_helper function, which only expects range_bpg_offset to
> contain 6-bit wide values.  As a consequence random slices appear
> corrupted on-screen (tested on a Sony Tama Akatsuki device with sdm845).
> 
> Use AND operators to limit these two's complement values to 6 bits,
> similar to the AMD and i915 drivers.
> 
> Fixes: b9080324d6ca ("drm/msm/dsi: add support for dsc data")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Side note: the DSC params tables are more or less common between amd, 
i916 and msm drivers. It might be worth moving them to the DSC helpers 
from the individual drivers. This would mean such masks handling can go 
into the helper too.

-- 
With best wishes
Dmitry

