Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34CF4394314
	for <lists+freedreno@lfdr.de>; Fri, 28 May 2021 14:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C79E26F5B4;
	Fri, 28 May 2021 12:59:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08D356E507
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 12:59:33 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id i67so3956752qkc.4
 for <freedreno@lists.freedesktop.org>; Fri, 28 May 2021 05:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=QkS67PNWJLrMlG0Eh1DFrl12I+MHfh0CuXPqyN2o9Jk=;
 b=RoE5+ne+IEtUIwJTmkaKAmIW8xmlFFiZyFu+RXc8Xtk3xP3WS2cnNmBkmt0rGcwaq/
 qb2PuixGE3rnUfQLjmTJ60OtadS6WqwIMVT+H21njXbcac9gUxl4ua+OaRnV6dmBPQGk
 cCjgQ0xixLesraJ7oA4Tw1q7d1IW86tp8+qcQKQmnLrhSW2W5PPT0vIu/dA7120u6STL
 lP8WtyfVW1q00VzSS8n+0giUcaceB12ncIClUcgKgzU6JWAGYtnVT6Fs+IJQA/a+kbEy
 bbqVyqPOW610wOc+b5AIAlA2tuOsdLLB6pV2bXvQM/3xs04eGLgpqeh/VYCtDPtFmGeu
 NfYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=QkS67PNWJLrMlG0Eh1DFrl12I+MHfh0CuXPqyN2o9Jk=;
 b=ErGs3c5hzhJ4xImbls/MXuC5LYNfULF4gY6kcv0bBEeKIHYPI7vVTEzrgIeTBYRibR
 VvKNEXH2uDoibM9d/NA2sFJkqv5xSH2rVs/mbHudyMa2vAG9upcoQMEYiTpM8w9GykqL
 P304bIYTvFp+UDCHUGTBaZdvdPO8+COt8HoyeN47Zwe7Y2LZvC6zzOw9Qh82nev74y5P
 VR4BwQ2ZTc8dKki1eOXgNXrxoHkFFnxvt14a+gQGUkXnQc1xgSTcnHS9AidszW1Ok+5x
 Xt8u8mX1/u76ovQLyCGHX45K42xPOFiIGQvV7FWaXW+WLiN+ez/y2m9I37/9FLDLDf6c
 GwwQ==
X-Gm-Message-State: AOAM530lcv6rpnbO86ApZLY4NrQU/OaLwa7yeqwtT5uOPO840635DI66
 zHAmrbG5Md0wpwU1TbuaICuuhfz0KYBaID2RvWQ=
X-Google-Smtp-Source: ABdhPJzrZ6/fmuomvi1UY7oEviJSluEuJL6Gjb+/l1q88tzyHFRCD8yK7EweolQnqF3+MS3DPRFyUQ==
X-Received: by 2002:a05:620a:745:: with SMTP id
 i5mr3821434qki.324.1622206771962; 
 Fri, 28 May 2021 05:59:31 -0700 (PDT)
Received: from [192.168.0.189] (modemcable068.184-131-66.mc.videotron.ca.
 [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id d6sm3525975qkf.109.2021.05.28.05.59.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 May 2021 05:59:31 -0700 (PDT)
To: Rob Herring <robh@kernel.org>
References: <20210423172450.4885-1-jonathan@marek.ca>
 <20210423172450.4885-3-jonathan@marek.ca>
 <20210503171139.GA2011901@robh.at.kernel.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <0e083e31-d349-6d5c-048f-258414492b2c@marek.ca>
Date: Fri, 28 May 2021 08:57:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20210503171139.GA2011901@robh.at.kernel.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH v2 2/2] dt-bindings: display: msm/dsi: add
 qcom, dsi-phy-cphy-mode option
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 5/3/21 1:11 PM, Rob Herring wrote:
> On Fri, Apr 23, 2021 at 01:24:40PM -0400, Jonathan Marek wrote:
>> Document qcom,dsi-phy-cphy-mode option, which can be used to control
>> whether DSI will operate in D-PHY (default) or C-PHY mode.
> 
> Given this is a standard MIPI thing, I think this needs to be a common
> property. We already have phy bindings that use the phy cells to set the
> phy type which I think you should use here. See
> include/dt-bindings/phy/phy.h.
> 

Is it OK to simply change the option to something like "phy-mode = 
<PHY_TYPE_DSI_CPHY>;"?

(using phy-cells would be annoying to implement, with no benefit IMO)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
