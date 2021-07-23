Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BBFB3D325A
	for <lists+freedreno@lfdr.de>; Fri, 23 Jul 2021 05:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD246FA2D;
	Fri, 23 Jul 2021 03:54:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C88396F9B2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jul 2021 03:54:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627012443; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=nQN5uEmmxljtrL0gK/REt7Aqr8xV5t9qIDXN+rNIgKs=;
 b=FZgW9vEV3udt4mScq8hHjVWnTulz8PLnxTJhChS6gEgFDbfLykJ40oAYNBgiMPlLIom4/sP0
 6j81CGARcu3suxGlito2C0Cv21l5UK17rl8JPPgg2O/zV6DKc1AWkJHUpRMp3Z5SdNFA5+o6
 ameiqeh+rCsDnJQl0W0fGy1C090=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 60fa3d434815712f3acfabb3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 23 Jul 2021 03:53:39
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6C3C1C433F1; Fri, 23 Jul 2021 03:53:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: maitreye)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 20DCFC433D3;
 Fri, 23 Jul 2021 03:53:37 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 22 Jul 2021 20:53:37 -0700
From: maitreye@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
In-Reply-To: <CAE-0n522OEz8YwKRb8VZtSbwAdjXReEPCwvL8N7kWycGSrbvxw@mail.gmail.com>
References: <1626909581-2887-1-git-send-email-maitreye@codeaurora.org>
 <CAE-0n50zCC9m9Wr6WUvM=mfaQ7GXVEjHNC_T2RfN1=9Y1U_qsg@mail.gmail.com>
 <4a97d331d7a60cb4756899d98f81ca4f@codeaurora.org>
 <CAE-0n522OEz8YwKRb8VZtSbwAdjXReEPCwvL8N7kWycGSrbvxw@mail.gmail.com>
Message-ID: <3989990264ac3e110c5385ea09ac7b2e@codeaurora.org>
X-Sender: maitreye@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH v4] drm/msm/dp: add logs across DP driver
 for ease of debugging
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
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 khsieh@codeaurora.org, seanpaul@chromium.org, abhinavk@codeaurora.org,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 2021-07-22 15:09, Stephen Boyd wrote:
Thank you for the comments .
> Quoting maitreye@codeaurora.org (2021-07-22 14:33:43)
>> Thank you Stephen.
>> 
>> On 2021-07-22 13:31, Stephen Boyd wrote:
>> > Quoting maitreye (2021-07-21 16:19:40)
>> >> From: Maitreyee Rao <maitreye@codeaurora.org>
>> >>
>> >> Add trace points across the MSM DP driver to help debug
>> >> interop issues.
>> >>
>> >> Changes in v4:
>> >>  - Changed goto statement and used if else-if
>> >
>> > I think drm likes to see all the changelog here to see patch evolution.
>> >
>> Yes, I will fix this
>> >>
>> >> Signed-off-by: Maitreyee Rao <maitreye@codeaurora.org>
>> >> ---
>> >> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
>> >> b/drivers/gpu/drm/msm/dp/dp_link.c
>> >> index be986da..8c98ab7 100644
>> >> --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> >> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> >> @@ -1036,43 +1036,28 @@ int dp_link_process_request(struct dp_link
>> >> *dp_link)
>> >>
>> >>         if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>> >>                 dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
>> >> -               return ret;
>> >>         }
>> >> -
>> >> -       ret = dp_link_process_ds_port_status_change(link);
>> >> -       if (!ret) {
>> >> +       else if (!(ret = dp_link_process_ds_port_status_change(link)))
>> >> {
>> >>                 dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
>> >> -               return ret;
>> >>         }
>> >> -
>> >> -       ret = dp_link_process_link_training_request(link);
>> >> -       if (!ret) {
>> >> +       else if (!(ret = dp_link_process_link_training_request(link)))
>> >> {
>> >>                 dp_link->sink_request |= DP_TEST_LINK_TRAINING;
>> >> -               return ret;
>> >>         }
>> >> -
>> >> -       ret = dp_link_process_phy_test_pattern_request(link);
>> >> -       if (!ret) {
>> >> +       else if (!(ret =
>> >> dp_link_process_phy_test_pattern_request(link))) {
>> >>                 dp_link->sink_request |=
>> >> DP_TEST_LINK_PHY_TEST_PATTERN;
>> >> -               return ret;
>> >> -       }
>> >> -
>> >> -       ret = dp_link_process_link_status_update(link);
>> >> -       if (!ret) {
>> >> +       }
>> >> +       else if (!(ret = dp_link_process_link_status_update(link))) {
>> >
>> > The kernel coding style is to leave the brackets on the same line
>> >
>> >       if (condition) {
>> >
>> >       } else if (conditon) {
>> >
>> >       }
>> >
>> > See Documentation/process/coding-style.rst
>> >
>> Yes, I will fix this
>> 
>> > Also, the if (!(ret = dp_link_...)) style is really hard to read. Maybe
>> > apply this patch before?
>> >
>> > ----8<----
>> > diff --git a/drivers/gpu/drm/msm/dp/dp_link.c
>> > b/drivers/gpu/drm/msm/dp/dp_link.c
>> > index 1195044a7a3b..408cddd90f0f 100644
>> > --- a/drivers/gpu/drm/msm/dp/dp_link.c
>> > +++ b/drivers/gpu/drm/msm/dp/dp_link.c
>> > @@ -1027,41 +1027,22 @@ int dp_link_process_request(struct dp_link
>> > *dp_link)
>> >
>> >       if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>> >               dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
>> > -             return ret;
>> > -     }
>> > -
>> > -     ret = dp_link_process_ds_port_status_change(link);
>> > -     if (!ret) {
>> > +     } else if (!dp_link_process_ds_port_status_change(link)) {
>> >               dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
>> > -             return ret;
>> > -     }
>> > -
>> > -     ret = dp_link_process_link_training_request(link);
>> > -     if (!ret) {
>> > +     } else if (!dp_link_process_link_training_request(link)) {
>> >               dp_link->sink_request |= DP_TEST_LINK_TRAINING;
>> > -             return ret;
>> > -     }
>> > -
>> > -     ret = dp_link_process_phy_test_pattern_request(link);
>> > -     if (!ret) {
>> > +     } else if (!dp_link_process_phy_test_pattern_request(link)) {
>> >               dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
>> > -             return ret;
>> > -     }
>> > -
>> > -     ret = dp_link_process_link_status_update(link);
>> > -     if (!ret) {
>> > +     } else if (!dp_link_process_link_status_update(link)) {
>> >               dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
>> > -             return ret;
>> > -     }
>> > -
>> > -     if (dp_link_is_video_pattern_requested(link)) {
>> > -             ret = 0;
>> > -             dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
>> > -     }
>> > +     } else {
>> > +             if (dp_link_is_video_pattern_requested(link))
>> > +                     dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
>> >
>> > -     if (dp_link_is_audio_pattern_requested(link)) {
>> > -             dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
>> > -             return -EINVAL;
>> > +             if (dp_link_is_audio_pattern_requested(link)) {
>> > +                     dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
>> > +                     ret = -EINVAL;
>> > +             }
>> >       }
>> >
>> >       return ret;
>> The reason I did this was to preserve the value of ret as the caller 
>> of
>> the function checks it. Some functions return -EINVAl like in here:
>> https://gitlab.freedesktop.org/drm/msm/-/blob/msm-next/drivers/gpu/drm/msm/dp/dp_link.c#L972
>> , so to check that it would be necessary to get the ret value.
> 
> ret is overwritten multiple times. The logic seems to be if ret is
> not-zero, reassign it, until we get to the end. How about this
> 
> ----8<----
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
> b/drivers/gpu/drm/msm/dp/dp_link.c
> index 1195044a7a3b..e59138566c0a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -1027,41 +1027,27 @@ int dp_link_process_request(struct dp_link 
> *dp_link)
> 
>  	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
>  		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
> -		return ret;
> -	}
> -
> -	ret = dp_link_process_ds_port_status_change(link);
> -	if (!ret) {
> +	} else if (!dp_link_process_ds_port_status_change(link)) {
>  		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
> -		return ret;
> -	}
> -
> -	ret = dp_link_process_link_training_request(link);
> -	if (!ret) {
> +	} else if (!dp_link_process_link_training_request(link)) {
>  		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
> -		return ret;
> -	}
> -
> -	ret = dp_link_process_phy_test_pattern_request(link);
> -	if (!ret) {
> +	} else if (!dp_link_process_phy_test_pattern_request(link)) {
>  		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
> -		return ret;
> -	}
> -
> -	ret = dp_link_process_link_status_update(link);
> -	if (!ret) {
> -		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> -		return ret;
> -	}
> -
> -	if (dp_link_is_video_pattern_requested(link)) {
> -		ret = 0;
> -		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> -	}
> -
> -	if (dp_link_is_audio_pattern_requested(link)) {
> -		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> -		return -EINVAL;
> +	} else {
> +		ret = dp_link_process_link_status_update(link);
> +		if (!ret) {
> +			dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
> +		} else {
> +			if (dp_link_is_video_pattern_requested(link)) {
> +				ret = 0;
> +				dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
> +			}
> +
> +			if (dp_link_is_audio_pattern_requested(link)) {
> +				dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
> +				ret = -EINVAL;
> +			}
> +		}
>  	}
> 
>  	return ret;
I do agree, this will solve the issue for over writing ret variable. But 
I can see two potential problems with this, if we get two events at the 
same time or one of the other we might end up processing the two events, 
which won't be the expected behavior. For example, if we get 
dp_link_process_link_status_update and it gives a non zero result and we 
go to the else statement, and get the event for video pattern request, 
we will  end up processing two events. The second problem, is currently 
we only have APIs that return 0 or EINVAL as return values, but if we 
ever in future add an API with a different return value it wont be easy 
to add the behavior. But if these issues seem like they can be ignored , 
then we can go ahead with your suggestions.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
