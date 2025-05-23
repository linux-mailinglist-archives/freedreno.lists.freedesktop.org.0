Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E21EBAC1CC2
	for <lists+freedreno@lfdr.de>; Fri, 23 May 2025 08:04:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9030410E1CB;
	Fri, 23 May 2025 06:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ImHdCe8t";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD3E10E1CB
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 06:04:03 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54N3omPb006603
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 06:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=UV98SJlDHledxhFDo9jLw8zV
 xQgtUKnhNjVjcgQdo2U=; b=ImHdCe8tHoC2xGdQtzUGLA5RHbzf+vATUTkIkSQS
 FTeyJzFvXxoft13uP9Sms6EZtG0BTMA9K/Re5ZkJbsFxTAO+dlGwfw+S7Jg0F8fr
 m2/aPccWm/cjW67ln2Y6sNqUIwGWjz6pNQIYgFDm3OouXIvu6GuHD/tuqpnqE+hj
 ILNgVGK2ZuWDdfjbyubGsueIKZdnpjdw9p5Ht5eE9ZDIchHS40aLOh5ojdpkWiv5
 eyr+J5gLwiZnyu+EiPTIa/ELmNzpnJljh7VyOJhF70HrZLuqcOwczgQhWM+6AJH/
 2VKBnuBMWfD3hxI+pU0FttxP/4984zL0eNvZiFqWlmhGpQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0rxwn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 23 May 2025 06:03:54 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8ae3c3d80so148362526d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 23:03:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747980219; x=1748585019;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UV98SJlDHledxhFDo9jLw8zVxQgtUKnhNjVjcgQdo2U=;
 b=PF0kuJE8mpzi8+mSSABmqy3b1H0qzwmFrOyQqiiFG+3JuLCQdpFOlHwAHEgp+tc92x
 oYG25fu/uQ+yQsKU3gEJc6bpid5WCXPvq35DAaOyAKlbjlrC0U8qrxr4MnDgPKiUJjHo
 wzTmXQPme2bta2CGRkSGFuFaFTST2cdJz5lwmdcdDOKd3MJFPpZ439+gXks3nzZV6lNU
 OotCrf9FZwdGy34lRETKBfqyycO6mGnvy9GkbG04CDjErRRy00Y6aCbZybUFR2qlKdjB
 8oufuKunzbyt8B5VmPeIVqZIxSE0mIU5lDpg2P50AiQBKDmzVQPUJ4X4OMOHUnpmXmdq
 P3YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9hTCukXfzkdvD2lVKgtpLrFMGb7fcJzZrJHDI2MyARGx5ylw0s43lv9gsuglkbgaoGHtIA7EYK80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzsERxlnqWVgohhvYABWSpBSYvwxjgsgpyRtO+nZUNVp1AW3ai
 KWh3L4QbLIy1KgAmdV2jyWmSw7wM/LjRx4mi9D+fK2AC0XNY083MU8CGST7JxwkbxgWv7V7mI9b
 q116x84EEWHwJEaRvVBYhBoD0MCj40Gm54P0iAbB66RvoRFuNj+isulDeYFa83tBhD64zHn8=
X-Gm-Gg: ASbGnct6XJseE6npdCGuzcp0YFafkvnMi7p58IFZ4GTuWMPrOgd2Cy/22p3rpsl9Ful
 gQX1dlXBEJLDjq504ggQB/cpjjXUK+UkDApaLL/g17awE62eXlG9FHGROArYb4ecCWdLnIE0rg5
 Iow9HmUAhbljpfH254hejzee1fsY/U2KttixopCcvNul+AqQ6NxkjLow9kivhu5f1mHGQYOPoWU
 +eTAIrYp2OUXCBcPnkX/L9NYOWyqE4l0yMvINi9gxkU4wGuWKGD13IS6OhEyL/e8VE7F5XepQ0I
 JVIFNljh7pUKia7PlS4Zb9HVq96RstRFpJiWxvmj3RjtGLYgu5McyuN4FJ2ja7sk3AdzV//hTFQ
 =
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id
 6a1803df08f44-6f8c23c8530mr420774756d6.7.1747980218602; 
 Thu, 22 May 2025 23:03:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsX+UYovSZ5WLAFK3mfMiKZ3n8sbTAf+PahFo4cG1WSbn2lp/efotGF404trhqTTlxvCyrWQ==
X-Received: by 2002:a05:6214:1c4f:b0:6f8:c23c:525c with SMTP id
 6a1803df08f44-6f8c23c8530mr420774376d6.7.1747980218192; 
 Thu, 22 May 2025 23:03:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084c8c78sm35129491fa.36.2025.05.22.23.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 23:03:37 -0700 (PDT)
Date: Fri, 23 May 2025 09:03:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Doug Anderson <dianders@chromium.org>, Johan Hovold <johan@kernel.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 2/4] drm/msm/dp: remove redundant ST_DISPLAY_OFF checks
 in msm_dp_bridge_atomic_enable()
Message-ID: <jlpssx4uplovssl57qc2uo4ulr45qarwtanosonpfydvvxbn24@thmsnxeyhyij>
References: <20241202-hpd_display_off-v1-0-8d0551847753@quicinc.com>
 <20241202-hpd_display_off-v1-2-8d0551847753@quicinc.com>
 <f6oh3kid5dfiqe7jy7j3d4gcv4evbtztzpgiygvzfsu6qlim2j@2vsulwcau6tr>
 <58d28874-0fcc-42f4-831d-1f304f7d9d4f@quicinc.com>
 <orsov5jni37n7m3xm4qdiurnfzdubxy45itmrb5gwi243l2l5t@vz623b5c35n5>
 <ldcydwcuwkwwng4d3b47pjz3ndhuhwerz6t3drwmifdzh7g3nl@3y6es72w74d7>
 <293d4298-7eb7-4e49-9334-f6024199ca7b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <293d4298-7eb7-4e49-9334-f6024199ca7b@quicinc.com>
X-Proofpoint-GUID: 3037-Zf1LelfjZKh3oxP1YXUHSk7rhDX
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=68300fca cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=M9gCn2pGLBaQ63AAPYcA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3037-Zf1LelfjZKh3oxP1YXUHSk7rhDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDA1NCBTYWx0ZWRfX7ophmyLDCkNX
 stF8m0kPikV3QpJlZTu24l/NbKZZo6OxCBaf63WvfgsSjyted3OJCw90Ym/m7elclq7lVfzetad
 VSVRe6wj9kGt1hJJc+DXvfprDO805cbJkhM7L2GXRcFL+zqbiwUocfl9tDsPk6uNWnYseLhXUAL
 2qe1GnufpPzbYziUi/VDC9Sxl4yGe/NRDyKCMIhXn+OOaLd0uuKkN80vZyA1Os26VTDb+rozJI+
 S/NsM2OjAZ3bDxljU8AwlhQ5DwP+jxm5rnH8gDNaJR2IXKR/gk7eGt5LD34OUmgEK5gEnM3q2Hb
 ga1w5wyCQH3VA88fEXH7nxG4EwnXVF7ieb4cATxj90D2wGLPki1FpfuAp2SWw4i6Jvfr3ZpZS50
 CwKuo6J9tUNigByDz4d25L77gDzALzWNB2V9tqklA9ji9f0lgjY+sdu+OsmxT4rkfjgrht/z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_02,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505230054
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Thu, May 22, 2025 at 09:21:00PM -0700, Abhinav Kumar wrote:
> 
> 
> On 12/23/2024 10:32 PM, Dmitry Baryshkov wrote:
> > On Wed, Dec 04, 2024 at 12:32:55PM +0200, Dmitry Baryshkov wrote:
> > > On Tue, Dec 03, 2024 at 07:24:46PM -0800, Abhinav Kumar wrote:
> > > > 
> > > > 
> > > > On 12/3/2024 5:53 AM, Dmitry Baryshkov wrote:
> > > > > On Mon, Dec 02, 2024 at 04:39:01PM -0800, Abhinav Kumar wrote:
> > > > > > The checks in msm_dp_display_prepare() for making sure that we are in
> > > > > > ST_DISPLAY_OFF OR ST_MAINLINK_READY seem redundant.
> > > > > > 
> > > > > > DRM fwk shall not issue any commits if state is not ST_MAINLINK_READY as
> > > > > > msm_dp's atomic_check callback returns a failure if state is not ST_MAINLINK_READY.
> > > > > 
> > > > > Can the state change between atomic_check() and atomic_commit()?
> > > > > 
> > > > 
> > > > Good question.
> > > > 
> > > > I cannot deny that such a possibility does exist.
> > > > 
> > > >  From what I can see in the state machine today, the only possibility I can
> > > > think of here is if a user very quickly removes the cable as soon as they
> > > > connect the cable like so fast that the connect was not yet processed before
> > > > disconnect.
> > > 
> > > If the cable has electrical issues, it is possible even w/o user
> > > intervention.
> > 
> > And the possible desynchronisation between DRM atomic states and HPD
> > state machine brings back the topic: can we get rid of the state
> > machine instead of trying to fix it? I'd rather see a patchset that
> > removes it completely. The link training should go to the atomic_enable,
> > etc, etc. Please? Pretty please? I'd rather see imperfect solution which
> > has possible issues with some of the dongles (as they can be fixed later
> > on) than having the imperfect HPD state machine which is known to break
> > DRM framework expectations.
> > 
> 
> Sorry for the delayed response.
> 
> The activity to move the link training to atomic_enable and to get rid of
> the state machine has started.
> 
> But, it is being done on top of this change only because this series
> actually gets rid of some states.
> 
> I will address the remaining comment on this and repost the next revision. I
> would suggest that if the state machine removal happens smooth, we can
> squash this series that with that one and post it together again and merge
> them together.
> 
> But if it takes longer than expected,  I think we should be open to merging
> this one and MST (with the comments addressed ofcourse) and the state
> machine removal goes on top.

No-no-no. State machine removal _must_ come before MST. Pretty much like
within the series the Fixes patches should come first. Otherwise it's
impossible to backport fixes to earlier series.

Not to mention that MST is a complicated code per se. Most likely it
will take several revisions to merge it.

> 
> Either way, this series is only helping the cause of getting rid of some of
> the states.

And possibly introduces new issues if the state changes between
atomic_check() and atomic_commit(), if I remember correctly.

I'm really asking to stop trying to do small fixes here and there and
rewrite this piece of code. I really don't want to see actual MST
implementation before HPD gets fixed.

> 
> Thanks
> 
> Abhinav
> > > 
> > > > 
> > > > Similarly, if an irq_hpd fires after atomic_check but before
> > > > atomic_enable(), and moreover if we hit the sink_count == 0 case in
> > > > msm_dp_display_handle_port_status_changed() during this irq_hpd,
> > > > 
> > > > In both these cases, then we will transition to ST_DISCONNECT_PENDING state.
> > > > 
> > > > Without this change, we would have bailed out in the ST_DISCONNECT_PENDING
> > > > case.
> > > > 
> > > > But other than this, I cannot atleast think of a case where a different
> > > > state transition can happen between atomic_check() and atomic_commit()
> > > > because for other transitions, I think we should be still okay.
> > > > 
> > > > But this is purely based on theoretical observation and hypothesis.
> > > > 
> > > > Is it better to add a check to bail out in the DISCONNECT_PENDING case?
> > > 
> > > I think so, please.
> > > 
> > > > 
> > > > OR document this as "To-do: Need to bail out if DISCONNECT_PENDING" because
> > > > even if I add this check, I dont know if can make sure this can be validated
> > > > as the check could never hit.
> > > > 
> > > > 
> > > > > > 
> > > > > > For the ST_DISPLAY_OFF check, its mainly to guard against a scenario that
> > > > > > there is an atomic_enable() without a prior atomic_disable() which once again
> > > > > > should not really happen.
> > > > > > 
> > > > > > To simplify the code, get rid of these checks.
> > > > > > 
> > > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/msm/dp/dp_display.c | 6 ------
> > > > > >    1 file changed, 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > index 992184cc17e4..614fff09e5f2 100644
> > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > @@ -1513,12 +1513,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
> > > > > >    		return;
> > > > > >    	}
> > > > > > -	state = msm_dp_display->hpd_state;
> > > > > > -	if (state != ST_DISPLAY_OFF && state != ST_MAINLINK_READY) {
> > > > > > -		mutex_unlock(&msm_dp_display->event_mutex);
> > > > > > -		return;
> > > > > > -	}
> > > > > > -
> > > > > >    	rc = msm_dp_display_set_mode(dp, &msm_dp_display->msm_dp_mode);
> > > > > >    	if (rc) {
> > > > > >    		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
> > > > > > 
> > > > > > -- 
> > > > > > 2.34.1
> > > > > > 
> > > > > 
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> > 
> 

-- 
With best wishes
Dmitry
