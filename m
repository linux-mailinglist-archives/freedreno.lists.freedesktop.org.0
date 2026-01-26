Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICCDIzq7d2lGkgEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 20:06:34 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC68C546
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 20:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB3C610E475;
	Mon, 26 Jan 2026 19:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BNgabcq6";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M05PuWzl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FD810E469
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 19:06:30 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60QHxSrG860194
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 19:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=; b=BNgabcq6SW2ytwfo
 4uTgF7dvX05saxO/C7YR+sA3rimUP/8WizBD7V1nrMJmPr7s+Jdx4jN/8IDKi5pr
 bujtO0yQ0jjkGnfCAPPRsBIO0ujzOp1LUKIaPKkvWq/52pQsV97GV27BAhpPUjm4
 iVg57RuM6u3SQ46WBqbDUNdIr1qDTR4nbMVdAXtPkISQepps5TCrls3DblZ5Bbm5
 QnGhUZPPM+O2tNhbxjyptgkNxyekw3eQ6MOXJgcfVRox4zbYwtSc21oJ2+92iBk+
 EV+LeZc+slStHTDNlk8oCfsR60P1RgF77NpJwXYXJaVkN85+etyfR3m4wffJ0EGZ
 ShO7tQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtyd2wn-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 19:06:30 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id
 a1e0cc1a2514c-94834f7a238so5680912241.3
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 11:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769454389; x=1770059189;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=;
 b=M05PuWzlx6N4gSbvFxPeUBxKzPouIVUK3/nWlqXewL5GPo7c2QpW5leUHZkPvqiqHR
 VdjwE2777lN7x2mevaqWqcXuJogKZWCVYoTqmSIg3bW0Imi2FFrI3qA1b5RzNBIo/UeL
 MTVsNi37bHdXFrvC4Ew1LMkho0yM96YyN5r0HjBY7bs5TsYw1p4O+PgMK8mJCHLJeZvP
 fyvU/+XZ9i/Fh4dyhWnob5rXlBlPX8oBHSBRRWeN1opNW3AOkHP1NK+gSGfZ6oFAgv6n
 CgELO7ImjIPGL6gxPAQvgjGg8YsRgniB9BNwFFtYm1wXUTWlZW6F0kqWa+yUyuCGN5bO
 I5Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769454389; x=1770059189;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K5Q/4zJ0owH3B9S+STbgEe6iJzJedmnk8hr33vBbkos=;
 b=soBpO3Iv/MeLJWwpe2yT5Q3Paz9HTpGkh+CgmV9+SYC6lSDBW45VAcBhEdw3H0z9+2
 YJ1THegqXZVxakj5FsWsUQ8a5evi2b+Ra0MTOUXazJaKWQXEKXpWcg/EPCNYPivebaya
 9pfjMfDeKL9t3SaGw9dMwKZKEQtQThOt+9XopRCLeEM2wEsWw5vj8qhT2NFUZZbLgCqu
 2+eLf8tY15LCrxaPSwr/+IBllZP8vZ6DvqooS0sldkBmdrnZS+16nT5/lv3mruXsp6KC
 /vh+IRyRv/IFvwHauXLevu+DBR4Ja2m0BaWrSRTCMGm5YzjvmY3J78WMbktQtuJVbphw
 GHvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfN7IMvhA0WVwxlROp0hhSUvbHa3/so5Aebfvpp6k0JVbASwRxvOz7r8NqrECmyWiDl9VbUdrOfco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxom3FXf/GoriPqgZo5vLJKT4wN83XzbxMhmakgHvINqUSTfPpj
 qv50mmAuXMdWHg4oXoO683yw/n8mJ8bGnqFqHtEkaOhnE1U0pzyRUWVtbcxsiP5baVOCMBaaQo0
 e7Ze/28LuTSLzXI7LpURLIFln6ZFBDcJ/gcFrTidZ5MxXzMsq4bw7T9Wa35x3VEpuQzhYwZw=
X-Gm-Gg: AZuq6aJ1bM/2fP9+utkjpJzMs94kPUpx+JGtLyXOuhC25/1uYR1J0drelVCfdFsxp2B
 5xzjW5TFOorab1FAIAAp8jeV0ykOa+Uu2CDOHwv8fVlAX0mq758/xu3QpCQHn2vJtGyyR6rFVW6
 tzwuKYu2oMgIVXpHE6CRwFpcfisaW7yn8CmDuD3fweT5MI7oqM/G+4ysbv90AJm4mLgt/xhDpEF
 nXeeEWt2VwfkmPArLADYkf1JQGBOSLjq/oG5sjN4jtU1ZBnO/08TIyJlAM0KveyQpphB9JGDIZn
 amCYXV2E74VjWRDwkB2AH1qUSFd027h/zYKVlUKu6SKhjW8ps9mtwJgD9dwGLdJtPK7WAhzSXqI
 3iY7/le3qyWc+q9UgL5p9CpS6GgaaL07clS48NHpZN1uedXnCQ3SMZGzVuS4bM2vLG1e61CFqC4
 y/j2zD9jaA2gWaum16pnISifw=
X-Received: by 2002:a05:6102:d86:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5f72379c561mr45482137.23.1769454389106; 
 Mon, 26 Jan 2026 11:06:29 -0800 (PST)
X-Received: by 2002:a05:6102:d86:b0:5f5:3c38:c4bc with SMTP id
 ada2fe7eead31-5f72379c561mr45465137.23.1769454388494; 
 Mon, 26 Jan 2026 11:06:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48df5b3sm2898858e87.6.2026.01.26.11.06.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 11:06:27 -0800 (PST)
Date: Mon, 26 Jan 2026 21:06:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Message-ID: <g2kzzrfmcsmzs6wz7alzjjycytpuebxwbehkco7yimdg2jam5a@uqsrt7mov7la>
References: <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
 <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
 <CABymUCMivNJt4fikx8XJ8KFZB-y4zc2RaqjBksxWrQFD9foEkg@mail.gmail.com>
 <7c3yxfkadtkd6xs6aiupcamykx75c2tieakc7n4a2jyymz6kzz@4gflcto2nbkj>
 <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMeS7cWgEProyWnMUJ1fF1rfba3dy4VB0mwTmPbpTvanA@mail.gmail.com>
X-Proofpoint-GUID: G37bQn4QHiAJxKuLnfzIrYODLoReMpWC
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=6977bb36 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=K78EwcQ-zvPrcKlDjY0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: G37bQn4QHiAJxKuLnfzIrYODLoReMpWC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDE2MyBTYWx0ZWRfXyDgrag/1rG30
 MgJ3Ih/dbpKi5vr4Ci5gR9AErEQImMt9NpTmMpmDCUmufAaFmD49e0d1MoqdaMq4L1BBX8enuM2
 x6xMTNqNr/q0QOhTm7oEewYqIhLgiJITV+hGwD8FhqqQ3MKqiwkbgMGf+Lgdrakm9Dt6eI2iSBh
 OuQcSx4yDb1U7+dGUYw+s3QfKaM7XXFKaWuaOxHzE6EbntV4lVRvQDI+3vWpYKS6DGJfOeHXTM1
 6jbEltvMqZvxnBbBmdye+LWxfyPosVZfD5qe5c2/TsHYGO6zeT0Aq4y4vzXZwz0hT+ZPCBgOK1Z
 BXwZQrDCWyhR/8tZXXyup7rxGjkV75iWj6t+4AMLuY/zJAQCI7wByquEeLXP3kissIKFjsL2uxa
 k6f0uGjE2l8Z0xfrSpuzlpJwCTxGWptnuIZ/DlA/SDuMDtNzol/sxb0PtrGl5Isq3K9yVvde3xS
 2kp4a+4FjHTgyuD64Uw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_04,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260163
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: ECBC68C546
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 09:29:44PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 20:31写道：
> >
> > On Mon, Jan 26, 2026 at 08:01:00PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:49写道：
> > > >
> > > > On 26/01/2026 12:29, Jun Nie wrote:
> > > > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
> > > > >>
> > > > >> On 26/01/2026 12:06, Jun Nie wrote:
> > > > >>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
> > > > >>>>
> > > > >>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> > > > >>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> > > > >>>>>>
> > > > >>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > > >>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
> > > > >>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
> > > > >>>>>>> is called from the CRTC side to ensure the topology information from
> > > > >>>>>>> the CRTC check is available.
> > > > >>>>>>
> > > > >>>>>> Why is it important? What is broken otherwise?
> > > > >>>>>
> > > > >>>>> I see. Thanks! Will add below lines in next version.
> > > > >>>>>
> > > > >>>>> By default, the plane check occurs before the CRTC check.
> > > > >>>>> Without topology information from the CRTC, plane splitting
> > > > >>>>> cannot be properly executed. Consequently, the SSPP
> > > > >>>>> engine starts without a valid memory address, which triggers
> > > > >>>>> an IOMMU warning.
> > > > >>>>
> > > > >>>> What is plane splitting? Write commit message for somebody who doesn't
> > > > >>>> exactly know what is going on.
> > > > >>>
> > > > >>> Thanks for the suggestion! Any more revise is needed?
> > > > >>
> > > > >> Sadly enough the text below is not a significant improvement.
> > > > >>
> > > > >>>
> > > > >>> Currently, splitting plane into SSPP rectangles the allocation occur
> > > > >>> during the plane check phase, so that a plane can be supported by
> > > > >>> multiple hardware pipe.
> > > > >>
> > > > >> What does this mean? Without virtual planes in place, there are no
> > > > >> multiple hardware pipes.
> > > > >>
> > > > >>> While pipe topology is decided in CRTC check.
> > > > >>
> > > > >> ?? What does it mean here?
> > > > >>
> > > > >>> By default, the plane check occurs before the CRTC check in DRM
> > > > >>> framework. Without topology information from the CRTC, plane splitting
> > > > >>> cannot be properly executed.
> > > > >>
> > > > >> What does 'properly' mean here? How is it executed? What happens?
> > > > >>
> > > > >>> Consequently, the SSPP engine starts
> > > > >>> without a valid memory address, which triggers IOMMU warning.
> > > > >>
> > > > >> IOMMU faults. There are no "warnings".
> > > > >>
> > > > >>>
> > > > >>> Defer above plane operations until dpu_assign_plane_resources()
> > > > >>> is called from the CRTC side to ensure the topology information from
> > > > >>> the CRTC check is available.
> > > > >>
> > > > >>
> > > > > Thanks for the patience!
> > > > >
> > > > >
> > > > > Currently, splitting plane into SSPP rectangles and allocation occur
> > > > > during the plane check phase. When virtual plane is enabled to support
> > > > > quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> > > > > a plane can be supported by 4 hardware pipes. And pipe number is
> > > >
> > > > number of pipes
> > > >
> > > > > decided in CRTC check per interface number, resolution and hardware
> > > > > feature.
> > > >
> > > > Okay, but IOMMU errors were reported with virtual planes being disabled.
> > > > So how is it relevant?
> > >
> > > After revise of splitting plane into pipes, the number of pipes will be decided
> > > by CRTC check for both virtual plane and non-virtual plane case to unify the
> > > plane handling,  instead of assumption of 2 pipes at most.
> >
> > This needs to be explicitly written.
> >
> > > >
> > > > >
> > > > > By default, the plane check occurs before the CRTC check in DRM
> > > > > framework. Without topology information from the CRTC, plane splitting
> > > >
> > > > WHat is plane splitting?
> > >
> > > How about: s/plane splitting/splitting plane into pipes ?
> >
> > This plane is not being split into anything. It's being mapped onto hw
> > pipes. But before that, the number of necessary hw pipes is being determined
> > based on foo, bar an baz,
> 
> Thanks for the correction!
> 
> Currently, plane is mapped onto at most 2 hardware pipes and 1 SSPP
> allocation occur during the plane check phase. When virtual plane is
> enabled to support quad-pipe topology later, 2 SSPPs with 4 rect will
> be needed, so that a plane can be supported by 4 hardware pipes.
> 
> After revise of quad-pipe, the number of pipes is decided in CRTC
> check per number of interfaces, resolution, clock rate constrain,

Where?

> hardware feature and virtual plane enablement. The decidsion of

decision

> number of pipes will happen in CRTC check for both virtual plane and
> non-virtual plane case to unify the plane handling. Before that, the

will? Do you mean, after this patch? If so, please use imperative
language. See Documentation/process/submitting-patches.rst

> the number of necessary hw pipes is being determined based on
> resolution and clock rate constrain.
> 
> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane mapping
> will be skipped for the first time as number of pipe is 0.
> Consequently, the SSPP engine starts without a valid memory address,
> which triggers IOMMU fault.
> 
> Defer above plane related operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.
> 
> >
> > >
> > > >
> > > > > will be skipped for the first time as pipe number is 0. Consequently,
> > > > > the SSPP engine starts without a valid memory address, which triggers
> > > > > IOMMU fault.
> > > > >
> > > > > Defer above plane related operations until dpu_assign_plane_resources()
> > > > > is called from the CRTC side to ensure the topology information from
> > > > > the CRTC check is available.

-- 
With best wishes
Dmitry
