Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A742C8FE7
	for <lists+freedreno@lfdr.de>; Mon, 30 Nov 2020 22:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D266E8C6;
	Mon, 30 Nov 2020 21:22:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C96A6E8C4
 for <freedreno@lists.freedesktop.org>; Mon, 30 Nov 2020 21:22:34 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606771355; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=jNW1t6Se5Ktv+ohrHgjF3LLGgAEq4iiGmKww3uVyBZQ=;
 b=B2cBn6k3ooIyEnMJP0G8qS7V8y2gySpqMl7GsnQlYeV0UnHBDpPQEm32EHMNYSC/VdOYoL50
 A0UikF4Wko776mG0TCO2bxwE0kyIN2epxf1F6lWVH/sERIQJHo0G2/CPKEpvalsfUvMngLoS
 0dRFi0ACpEqGtkk4N7v+5MsbdHc=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5fc562984a918fcc078ee768 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 21:22:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7A076C43461; Mon, 30 Nov 2020 21:22:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 81D48C433C6;
 Mon, 30 Nov 2020 21:22:31 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 30 Nov 2020 13:22:31 -0800
From: abhinavk@codeaurora.org
To: Rob Clark <robdclark@gmail.com>
In-Reply-To: <20201129181243.1091742-1-robdclark@gmail.com>
References: <20201129181243.1091742-1-robdclark@gmail.com>
Message-ID: <2a4ac82e8f904e2b8aeee0d6718a1ac0@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH] msm/mdp5: Fix some kernel-doc warnings
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
 David Airlie <airlied@linux.ie>, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2020-11-29 10:12, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function
> parameter or member 'ctl' not described in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function
> parameter or member 'pipeline' not described in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Function
> parameter or member 'enabled' not described in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:227: warning: Excess
> function parameter 'enable' description in
> 'mdp5_ctl_set_encoder_state'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'ctl' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'pipeline' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'flush_mask' not described in 'mdp5_ctl_commit'
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c:529: warning: Function
> parameter or member 'start' not described in 'mdp5_ctl_commit'
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> index 030279d7b64b..81b0c7cf954e 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_ctl.c
> @@ -216,7 +216,9 @@ static void send_start_signal(struct mdp5_ctl *ctl)
>  /**
>   * mdp5_ctl_set_encoder_state() - set the encoder state
>   *
> - * @enable: true, when encoder is ready for data streaming; false, 
> otherwise.
> + * @ctl:      the CTL instance
> + * @pipeline: the encoder's INTF + MIXER configuration
> + * @enabled:  true, when encoder is ready for data streaming; false, 
> otherwise.
>   *
>   * Note:
>   * This encoder state is needed to trigger START signal (data path 
> kickoff).
> @@ -510,6 +512,13 @@ static void fix_for_single_flush(struct mdp5_ctl
> *ctl, u32 *flush_mask,
>  /**
>   * mdp5_ctl_commit() - Register Flush
>   *
> + * @ctl:        the CTL instance
> + * @pipeline:   the encoder's INTF + MIXER configuration
> + * @flush_mask: bitmask of display controller hw blocks to flush
> + * @start:      if true, immediately update flush registers and set 
> START
> + *              bit, otherwise accumulate flush_mask bits until we are
> + *              ready to START
> + *
>   * The flush register is used to indicate several registers are all
>   * programmed, and are safe to update to the back copy of the double
>   * buffered registers.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
