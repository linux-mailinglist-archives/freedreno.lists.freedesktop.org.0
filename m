Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F63BB471
	for <lists+freedreno@lfdr.de>; Mon,  5 Jul 2021 01:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A31189B18;
	Sun,  4 Jul 2021 23:47:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Sun, 04 Jul 2021 23:47:16 UTC
Received: from vps5.brixit.nl (vps5.brixit.nl [192.81.221.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC7B89B18;
 Sun,  4 Jul 2021 23:47:16 +0000 (UTC)
Received: from [192.168.20.102] (unknown [77.239.252.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by vps5.brixit.nl (Postfix) with ESMTPSA id 566736086F;
 Sun,  4 Jul 2021 23:40:05 +0000 (UTC)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
 <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
Message-ID: <95f0c71f-2d22-98c0-a587-1125070b11de@postmarketos.org>
Date: Mon, 5 Jul 2021 02:41:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
Content-Language: en-US
Subject: Re: [Freedreno] [RFC 3/6] drm/msm/mdp5: move
 mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 6/10/21 12:17 AM, Dmitry Baryshkov wrote:
 > Move a call to mdp5_encoder_set_intf_mode() after
 > msm_dsi_modeset_init(), removing set_encoder_mode callback.
 >
 > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
 > ---
 >   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 >   1 file changed, 3 insertions(+), 8 deletions(-)
 >

My Samsung Galaxy S5 with mdp5 and cmd mode panel seems to work same as 
before with these patches applied.

Tested-by: Alexey Minnekhanov <alexeymin@postmarketos.org>

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
