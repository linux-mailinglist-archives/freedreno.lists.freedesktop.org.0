Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1A378FC9
	for <lists+freedreno@lfdr.de>; Mon, 10 May 2021 15:57:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CE36E489;
	Mon, 10 May 2021 13:57:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 2046 seconds by postgrey-1.36 at gabe;
 Mon, 10 May 2021 06:35:52 UTC
Received: from www.kot-begemot.co.uk (ivanoab7.miniserver.com [37.128.132.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D91666E222;
 Mon, 10 May 2021 06:35:52 +0000 (UTC)
Received: from tun252.jain.kot-begemot.co.uk ([192.168.18.6]
 helo=jain.kot-begemot.co.uk)
 by www.kot-begemot.co.uk with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1lfyz9-0006DY-Qs; Mon, 10 May 2021 06:01:44 +0000
Received: from madding.kot-begemot.co.uk ([192.168.3.98])
 by jain.kot-begemot.co.uk with esmtps
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <anton.ivanov@cambridgegreys.com>)
 id 1lfyz7-0004m2-Bb; Mon, 10 May 2021 07:01:43 +0100
To: Zhen Lei <thunder.leizhen@huawei.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210510031606.3112-1-thunder.leizhen@huawei.com>
From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
Organization: Cambridge Greys
Message-ID: <9109a395-099b-ed14-4433-d4bf6dbf5cef@cambridgegreys.com>
Date: Mon, 10 May 2021 07:01:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210510031606.3112-1-thunder.leizhen@huawei.com>
Content-Language: en-US
X-Spam-Score: -1.0
X-Spam-Score: -1.0
X-Clacks-Overhead: GNU Terry Pratchett
X-Mailman-Approved-At: Mon, 10 May 2021 13:57:05 +0000
Subject: Re: [Freedreno] [PATCH v2 0/1] drm/msm/dpu: Fix error return code
 in dpu_mdss_init()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 10/05/2021 04:16, Zhen Lei wrote:
> v1 --> v2:
> According to Anton Ivanov's review comments, detele the unnecessary local
> variable initialization "ret = 0".
>
>
> Zhen Lei (1):
>    drm/msm/dpu: Fix error return code in dpu_mdss_init()
>
>   drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
I do not recall reviewing this.

I think you got the wrong Anton Ivanov - I maintain UML so the previous 
revision hit someone's else inbox.

-- 
Anton R. Ivanov
Cambridgegreys Limited. Registered in England. Company Number 10273661
https://www.cambridgegreys.com/

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
