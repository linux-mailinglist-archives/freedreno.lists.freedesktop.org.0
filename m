Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B634B742A
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 18:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DD310E487;
	Tue, 15 Feb 2022 17:46:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 472 seconds by postgrey-1.36 at gabe;
 Tue, 15 Feb 2022 17:43:18 UTC
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AFA10E487
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:43:18 +0000 (UTC)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C83EB40259
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 17:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644946524;
 bh=+P9PcpKT0xdbty/hJ1bxhDi4Mvr/vrZbJ+31zABw+Os=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=MbRw2Ve1X/XfWjVfW69aWnIHbQnCdkusELs8x/o/Z+j2d33oozjvjFivXBHD//Ns7
 JaPj6G7n0sUA2G31wKU1sDJTUGlOMHPyztsPg+3rpvv6YoxOEmM1llt1kEX8ne51HR
 YHFO9pgVDC1Be/XC8RAhFrgHWkvb/c5TefolV9svt8MPBKOhYV9Pe6jSWoJuDDemqs
 7GkavfZsK9MupVej/ptlO4GgD+SeYla0Az6Buq5BFzqPIcE6thnQzl/c9XMyDTX0Ly
 S1czT2KzvFqJ6UrVjw3TsafYTF3v0tL2TUnxLzPZeNeDeLP2Gaa0QKFnZGqyJAhPWr
 RpHHMLqS9Bw5A==
Received: by mail-wr1-f69.google.com with SMTP id
 q8-20020adfb188000000b001e33a8cdbf4so8630955wra.16
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 09:35:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+P9PcpKT0xdbty/hJ1bxhDi4Mvr/vrZbJ+31zABw+Os=;
 b=BqgTYjmcIBDhMuL51ELHF6f1hu36RyGgkgx8ZF4Xuiok0S7QyM9pXYeekL19LmxuYk
 xAvtKhvdqyjU6Zb8GXBCHMGx3RVRpPCcbJ5VRVILaiZO5uH7dWs1iPhqKujXWwCjbTVx
 hnrpFdwRtAOIAUAyPHU+PdtaOiKdPpVImUjDW0O8WFwZUSNG1ZAfUYSUYvJ05xzAqRem
 E9d/9Idz+jQ8vM0HVDWgtiTKjhm7g4DrWqMVbVaWRstjzsAvui21t1TnlYPmvkrXrvSs
 y6ZFNohRxUJwSA3/X2ulveka2DWYvfhay57xd2jhp6ukd+P1+f5Kq0yXDoV3b2FyH/aQ
 Ucyw==
X-Gm-Message-State: AOAM531Col+6q+y9aLG7a3l1WNBjfkU76k/61AqCXZyk3FDg1RbuXEi/
 NHKmfD6Pnpqen/4m8FzHTTA2wKxbm8/Ti1GoFBSoTDrYWpsmpNGdImsZGr5zibrZHptVvOfZUL9
 cJjVhae9skJFOlweuo/O1IlzYdLlJ9P+0Tijk8G7sz8UoDQ==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr25443wrw.537.1644946524480;
 Tue, 15 Feb 2022 09:35:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwHVvxLlKwb0vEtmbBdnfyiKN8+jTxOLmhaciEyPHxsyHO6/CWWCijyKhPRtdxqziX1NdO0/Q==
X-Received: by 2002:a5d:68cd:: with SMTP id p13mr25416wrw.537.1644946524266;
 Tue, 15 Feb 2022 09:35:24 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id s7sm16804963wrw.71.2022.02.15.09.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Feb 2022 09:35:23 -0800 (PST)
Message-ID: <d1ce6c2b-e1f3-1c2e-a6fd-d506848b2c12@canonical.com>
Date: Tue, 15 Feb 2022 18:35:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Stephen Boyd <swboyd@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>
References: <20220127200141.1295328-1-swboyd@chromium.org>
 <20220127200141.1295328-26-swboyd@chromium.org>
 <7c517b787d1dd768372d0141f5078e3089e883cb.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <7c517b787d1dd768372d0141f5078e3089e883cb.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 15 Feb 2022 17:46:13 +0000
Subject: Re: [Freedreno] [PATCH v6 25/35] iommu/mediatek: Migrate to
 aggregate driver
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
Cc: freedreno@lists.freedesktop.org, Saravana Kannan <saravanak@google.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Russell King <rmk+kernel@arm.linux.org.uk>, Will Deacon <will@kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/02/2022 12:03, Yong Wu wrote:
> On Thu, 2022-01-27 at 12:01 -0800, Stephen Boyd wrote:
>> Use an aggregate driver instead of component ops so that we can get
>> proper driver probe ordering of the aggregate device with respect to
>> all
>> the component devices that make up the aggregate device.
>>
>> Cc: Yong Wu <yong.wu@mediatek.com>
>> Cc: Joerg Roedel <joro@8bytes.org>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
>> Cc: Rob Clark <robdclark@gmail.com>
>> Cc: Russell King <rmk+kernel@arm.linux.org.uk>
>> Cc: Saravana Kannan <saravanak@google.com>
>> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> 
> + Krzysztof
> 
> The memory/mtk-smi.c is expected to get Ack from Krzysztof.
> 

Please resend with cc-ing me. I don't have the patch in my mailbox (wes
not on address list) and I also cannot find it in linux-arm-kernel.

Best regards,
Krzysztof
