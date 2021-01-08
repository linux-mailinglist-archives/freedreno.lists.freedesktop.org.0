Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 857C22EF339
	for <lists+freedreno@lfdr.de>; Fri,  8 Jan 2021 14:40:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45EDD89B3B;
	Fri,  8 Jan 2021 13:39:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D11889BB2
 for <freedreno@lists.freedesktop.org>; Fri,  8 Jan 2021 13:39:57 +0000 (UTC)
Received: from [192.168.1.101] (abaf53.neoplus.adsl.tpnet.pl [83.6.169.53])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 252EA3F611;
 Fri,  8 Jan 2021 14:39:52 +0100 (CET)
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>, robdclark@gmail.com
References: <CAF6AEGu0Sv6nYNDn0z61pXRjNyFLpLw5S4_O3opmrQ-UVNR_MA@mail.gmail.com>
 <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
From: Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <fa091855-8096-6377-e173-ce1cd02f74ec@somainline.org>
Date: Fri, 8 Jan 2021 14:39:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210108122601.14993-1-saiprakash.ranjan@codeaurora.org>
Content-Language: en-US
Subject: Re: [Freedreno] [PATCH] drm/msm: Only enable A6xx LLCC code on A6xx
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
Cc: sean@poorly.run, shawn.guo@linaro.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 martin.botka@somainline.org, akhilpo@codeaurora.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 jcrouse@codeaurora.org, marijn.suijten@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, daniel@ffwll.ch,
 angelogioacchino.delregno@somainline.org, airlied@redhat.com,
 phone-devel@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

> Konrad, can you please test this below change without your change?

This brings no difference, a BUG still happens. We're still calling to_a6xx_gpu on ANY device that's probed! Too bad it won't turn my A330 into an A640..

Also, relying on disabling LLCC in the config is out of question as it makes the arm32 kernel not compile with DRM/MSM and it just removes the functionality on devices with a6xx.. (unless somebody removes the dependency on it, which in my opinion is even worse and will cause more problems for developers!).

The bigger question is how and why did that piece of code ever make it to adreno_gpu.c and not a6xx_gpu.c?

To solve it in a cleaner way I propose to move it to an a6xx-specific file, or if it's going to be used with next-gen GPUs, perhaps manage calling of this code via an adreno quirk/feature in adreno_device.c. Now that I think about it, A5xx GPMU en/disable could probably managed like that, instead of using tons of if-statements for each GPU model that has it..

While we're at it, do ALL (and I truly do mean ALL, including the low-end ones, this will be important later on) A6xx GPUs make use of that feature?

Konrad

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
