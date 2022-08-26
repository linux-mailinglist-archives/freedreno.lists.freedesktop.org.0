Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BF85A23BF
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E3810E7A8;
	Fri, 26 Aug 2022 09:09:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D46510E7A5
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:09:15 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id by6so965453ljb.11
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=SNV8O/j0YC1LnQIURnHLXp1X7n9kt6rf3nYGRIpE0BY=;
 b=ZBKdDfcD4nil3pqJq6LwBIiTZorLaHyPtanKz04jAXuXlP5owAtD/wo5GbtNEqV0RW
 cvNKckWCWQq10qWYnZOg5HXYhfvT6q2Pi8tHSUqOsx64rZ9tBS1YecovDS/OIFaGBzui
 iN/zPL9qWD1Tz74K3MVHhpyF394lq/+x8/cp7Sl7eM67Ryrh3Cmqy+fWQVcBYgYuSIFM
 lim55CXl6sk7roaDfA0QrzNjhSL7/7ziaBdHldts/nj4QRfrSfQXuY7RN+qm7itN+Fsf
 ERe8kpVoayqjoR1R6rcBeVIkEsoZLbdyD3PrBvve9a3wtxZh/TopNdXrbeRJxDU4UAIe
 luQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=SNV8O/j0YC1LnQIURnHLXp1X7n9kt6rf3nYGRIpE0BY=;
 b=UKRjx90ANfWcgn2a+0YYwWec6NQZLXzSvBxAHmmrL2UQpBFRrfmh9VZTWeWO8zEOWb
 i8Ys2OTqNK3osuJDSez2AWJF/AyzgyVtTNP/edgBpecQK4fYBEscLN6/pCI3Hn33xD5w
 OLvzIDlbF1E1/TocCrMkuIdGhnxqzprio9mdEXlg2B1BxxBP8nVlj4/Oq/WosoMTHrlF
 pUYXp7KD86//QBwA0N/pu9jfVFp35hk8Hj3JycemowYGsVgfzfKtbVkbCBBe5eRHu7qz
 wNMgmzBzvcBwUzqWQPdTjz1fE0A8fLUzrDcboXLlgXB3dTYClmtRIr/9Z7pVC7zfSrTb
 3nyQ==
X-Gm-Message-State: ACgBeo36qeJAXA5Ja+5cuEwS+mm99Gkk8s9GXKA8EFVa3SgMg+Y67EI4
 E04ecrMdYGtYhuay2pUsC1N5hQ==
X-Google-Smtp-Source: AA6agR4uPuUZ2AMFJatBZ7/LNfyWyktlihZYaXvgka5zA4yqK6tAUXi24Vs3MnxDbnhgmlGclDtJMw==
X-Received: by 2002:a2e:a90a:0:b0:261:d622:248c with SMTP id
 j10-20020a2ea90a000000b00261d622248cmr1985262ljq.332.1661504953633; 
 Fri, 26 Aug 2022 02:09:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 b10-20020a056512070a00b0048a91266268sm306753lfs.232.2022.08.26.02.09.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Aug 2022 02:09:13 -0700 (PDT)
Message-ID: <a7a313c2-66bb-0551-22c1-365cf9a5c855@linaro.org>
Date: Fri, 26 Aug 2022 12:09:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1657912468-17254-1-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1657912468-17254-1-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: populate wb or intf before
 reset_intf_cfg
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
Cc: dri-devel@lists.freedesktop.org, swboyd@chromium.org, robdclark@gmail.com,
 seanpaul@chromium.org, daniel@ffwll.ch, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 15/07/2022 22:14, Abhinav Kumar wrote:
> dpu_encoder_helper_phys_cleanup() was not populating neither
> wb or intf to the intf_cfg before calling the reset_intf_cfg().
> 
> This causes the reset of the active bits of wb/intf to be
> skipped which is incorrect.
> 
> Fix this by populating the relevant wb or intf indices correctly.
> 
> Fixes: ae4d721ce100 ("drm/msm/dpu: add an API to reset the encoder related hw blocks")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry

