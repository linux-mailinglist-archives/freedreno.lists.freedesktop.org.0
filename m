Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iLGuK/KeeGn4rQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 12:18:10 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0939376C
	for <lists+freedreno@lfdr.de>; Tue, 27 Jan 2026 12:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDEE10E538;
	Tue, 27 Jan 2026 11:18:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VGUQjWgB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I8MyEnsr";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E083810E538
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:18:07 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60RA9MpV1268740
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:18:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=; b=VGUQjWgBR6noPd30
 leOieDCXmP2JFK77aWaBCmrsCzt8AERkdSo7AvT1omojqsB5c/7OTKSL+e/kNqeV
 zKoF/LWZ7vEuSBmV8xjc63CwCrDdDvfUetJAKY6EG3mmtmV3gy2PbBqisEeL6GOB
 +gRbcmDgZcqT+zVMUSB7/ZjGcm5buVd4XcaILgOP6hu07tYc300G2r0nzGXImvPw
 fodJZvJLCuIdaGP4Gnxd90TSreZ0B195VYYvgZfmVsl1N3RJ1DA+VBBr2QfS64zx
 XoOj5VMJ2QdGKvtvz4vY0/1QbXeLxfsbqA5EP6/rLcvZciI48RnKMIDFaspdp9eg
 3f/VxA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyasext-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 11:18:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c1cffa1f2dso1707369985a.1
 for <freedreno@lists.freedesktop.org>; Tue, 27 Jan 2026 03:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769512686; x=1770117486;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=;
 b=I8MyEnsr/cyprv+wWkzg6so61Y9I+9C90Dw4ylUWYW+yXsrpw1wWi87u99NVL8UZUG
 yNmVodfEKETFQAKd4ai325jKOGCbB5a/85pni2TKifZl0hFFraMBrhG6yW/N746ka5sA
 XK2CO33C+6Z7xLQz9vcZj9purie6EaOX42lHxAF7OZCNYRooKcUl2V3Wr5H4Hm8w3OqV
 7e5b2Zhzf4eeUWIk6AhaYObl2FrsQDRAsv0EXoXiiYbQ7AuZC1toARMWR3Lxr2VwJ6ht
 XEt6RNPxxiLUKHnE44UBgmO5W4OwCZpfkeybCLbL3+GaAvdMchbOCImXlV5d7PNoUzo5
 iHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769512686; x=1770117486;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5xnQobEIb3PTCiTRAm6iLAFohZ8k6yzMVc57xfyF6Qg=;
 b=cuES/2AZeZS3w7CiORYi+W4TZx0d+9tzuFbqsJKe2SjbF3H/dWtGvsAh2V48KVUcue
 7pdqYTffgpRK7cP5pfQLsDmQ1tedvnmT3A8k5CjXs1ziQThP4bT3Eu3VPcCNzzlQYHLF
 oGp1nAnlbjM8N6+pjQ3sn1/Aya4N6VV63IvzaePUAtREYtzlqCS+qys3MMQELJceaJOS
 uLpsxNpt770yhKFMZVmZfakw0rCy6MTWPMuAdfVZLB46nyNF3Jmvy3UFI3inIMKuLGOA
 pA3G7okKubYSz7n75RTdvmiZnR/T+ScFW1yQGef3K5h1uV7JFBUyBGx1gJbqeJpOgaw+
 46Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8QwtBZoM90DDu/2j/wJ08XFRyTofxtOahzoJyPVkhbHbEX3HTAu/Ghn9NVRJYofj3tygE/JxOzmQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx/6hu4JIx9iuz0LlWxxYafjWxas6oBAfT7COgZJkYzh9KIIbT
 xhseOVccQ8vxqxaPDal8h1WvYyQocf+a7CXjStMWvAdkBxJjtHqpV8w+e31/s5o6CLj1k3QFADD
 OrMDn6cA3b2DWKOfTR8Q439amXu3LxOd2ogEqa4JRV6wglJUFKjJ0WEGILXLgvcGLSQlIbY4=
X-Gm-Gg: AZuq6aIm3tnE8ttlQM/lvEPA16jTlf/fbcJnUv1Lttl/GW23O35lHbHskj8h5eXdrKI
 A3+AerfEFXAQwA+MpW+4bVpek2LociY3EPOgM3f2WWdOMudG9j4DOT2J9swuQsGRvKqEadY9yGX
 /DutLyti7PTnHL5y8AABQSClf0Xu9Dx7GvuBOf+k5/iJKl/3rEcF320zBvYJ+VlSArnQ1x3MvpZ
 RIU5d+G2jvEOLaNL8pYgFo8Gy+YcuduCTdxvyLb3/u4ez1IIsgrsZZ/BpLFkrXn1PVwnL3iHCFo
 XYZmacfNuD1THIVlga7U6y9SfyLPWzAlHt1nG7IHWbB1viqD9OCrIx2Nqw0Eg9cdIVQx/lH0jsR
 NgFtZ9QxNAkq1zCgIHu4YRAxx8GgSzt5Mp0Wjy4V9L7YnjkSaif6dqfQSFwqIBCBvshVlGf0tpj
 3I3635hBs/04w+veDBHCUbTec=
X-Received: by 2002:a05:620a:2a09:b0:89d:b480:309f with SMTP id
 af79cd13be357-8c70c17d2eamr106850285a.7.1769512686219; 
 Tue, 27 Jan 2026 03:18:06 -0800 (PST)
X-Received: by 2002:a05:620a:2a09:b0:89d:b480:309f with SMTP id
 af79cd13be357-8c70c17d2eamr106847585a.7.1769512685738; 
 Tue, 27 Jan 2026 03:18:05 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385da01d635sm34904291fa.21.2026.01.27.03.18.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jan 2026 03:18:05 -0800 (PST)
Date: Tue, 27 Jan 2026 13:18:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: try reserving the DSPP-less LM first
Message-ID: <ci7m26yyzojptbfzengfhuudhqbofmljkxbraufpsnlvnzl7us@35hmb6vjabjp>
References: <20260115-dpu-fix-dspp-v1-0-b73152c147b3@oss.qualcomm.com>
 <20260115-dpu-fix-dspp-v1-2-b73152c147b3@oss.qualcomm.com>
 <33424a9d-10a6-4479-bba6-12f8ce60da1a@packett.cool>
 <whko2yur7tgutr4qhlbqfrvpcdg7hkyw66koicqvpvfhk55c7z@saj2uxrduv4z>
 <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff0c70f3-62aa-43f5-a437-62aae5b84e9c@packett.cool>
X-Proofpoint-GUID: sZYg87A2C8I-4MMyfvMNK53fQqHIKlBK
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=69789eee cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bVB5Ggzyottavkt8X-EA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sZYg87A2C8I-4MMyfvMNK53fQqHIKlBK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5MiBTYWx0ZWRfX8xlmRtnDhk8h
 qb4C9waJzxnveOe0P0rfR6P/LXhIhubkIwPdhnYsvCE82cwBIVb5AtaySYs9KzewhOidrqpmcI+
 00tWaXMDegPIA4DSOvyaWBuSjJ8uyHr7mwwThEWYJEgyyLTBxewWjBGcIRPjleHRDf2k/Gw2B9/
 nHQaOGk2jv/EQiIF+1kETGfdY/cBo16r/wdNuziP24wEkyyx88mUql4HKd2YWz4jLzgm8LwUaM0
 IV/eL03WVYBQqYf9ATv2Bm2DSPKpp22QBvoV/ij3C6+fqo6Rgk/dNKoqeHZmPaVvZbjOYLF//R0
 K1r9aM6O9naBoeNLRA8wyNQGcFKgVfAZXQIYsVre/WKaxoxAkUnxsLbGY1FyxIWiLdhMiFgEelV
 JdmfcABVGANNZwqGR3AV46wYR/E1m1+Jhdkl4+/gvhjAyOm2AvnaMG1eK+M+/b3o9qCWAwTiS8K
 1RdqJncUqVlSWP77czA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270092
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:val@packett.cool,m:robin.clark@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 1E0939376C
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 07:59:34AM -0300, Val Packett wrote:
> 
> On 1/27/26 7:34 AM, Dmitry Baryshkov wrote:
> > On Tue, Jan 27, 2026 at 06:43:32AM -0300, Val Packett wrote:
> > > this has massively broken things on my x1e device (latitude-7455):
> > > [..]
> > > Reverted only this commit and it's back to normal, so I'm pretty sure it's
> > > this.
> > Interesting. Could you please capture the dri-state (only the last part,
> > resource mapping) with the external monitor attached and with this
> > commit reverted?
> 
> Just reverted:
> 
> crtc[106]: crtc-0 [..]
>         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 1720
> 0x48 0x9
>         lm[0]=0
>         ctl[0]=0
>         dspp[0]=0
>         lm[1]=1
>         ctl[1]=0
>         dspp[1]=1
> crtc[107]: crtc-1 [..]
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=2
>         ctl[0]=1
>         lm[1]=3
>         ctl[1]=1
> resource mapping: pingpong=106 106 107 107 # # - - # # - - - mixer=106 106
> 107 107 # # - - ctl=106 107 # # # # - - dspp=# # # # - - - - dsc=# # # # - -
> - - cdm=# sspp=# # # # - - - - # # # # # # - - cwb=- - - -
> 
> > Also, could you please run another check:
> >   - revert this commit
> >   - comment out LM_2, LM_3 in the catalog
> >   - try the resulting kernel with the external monitor
> 
> Commented out:

Thanks! I assume external monitor is working fine?

> 
> crtc[106]: crtc-0 [..]
>         mode: "2560x1600": 60 280710 2560 2608 2640 2720 1600 1603 1609 1720
> 0x48 0x9
>         lm[0]=0
>         ctl[0]=0
>         dspp[0]=0
>         lm[1]=1
>         ctl[1]=0
>         dspp[1]=1
> crtc[107]: crtc-1 [..]
>         mode: "3840x2560": 60 631750 3840 3888 3920 4000 2560 2563 2573 2633
> 0x48 0x9
>         lm[0]=4
>         ctl[0]=1
>         lm[1]=5
>         ctl[1]=1
> resource mapping:
>         pingpong=106 106 # # 107 107 - - # # - - -
>         mixer=106 106 - - 107 107 - -
>         ctl=106 107 # # # # - -
>         dspp=# # # # - - - -
>         dsc=# # # # - - - -
>         cdm=#
>         sspp=# # # # - - - - # # # # # # - -
>         cwb=- - - -
> 
> Not sure why the dspp= line in resource mapping doesn't show any numbers
> when a crtc has dspp[0]= and dspp[1]= o.0

Ah, it might be confusing. The crtc-N blocks shows that LM in theory has
DSPP blocks.

Resource mapping shows if the DSPP is actually allocated (aka used for
the post processing).

> 
> But with LM 4+5, gamma control doesn't affect the external monitor.

Yes, that's expected.

> 
> 
> ~val
> 

-- 
With best wishes
Dmitry
