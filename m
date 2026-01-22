Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD4rF1/6cWmvZwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 11:22:23 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0BD652C9
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 11:22:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620E10E251;
	Thu, 22 Jan 2026 10:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nok1F27h";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nov0YX+Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4D0210E05D
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 10:22:19 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60M87Jwe3868713
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 10:22:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ep5QnDcp6sQDu4JB5aEYhZ5VmVnyTogSqCaLPVY9tRY=; b=nok1F27hL5N+TZAv
 z3hwITteIMlEzVEz6UicBItPfcQtasysVLRbsuqvHyKO3vg3TgwU06b/JFaF8wTp
 BKrnX8jKCTPqCfxfcTuFo5wvIZEYAZRUwjIpVvg8RDbkh7wifRdhtznAg0aIToLp
 nI42A+YTFvnKB2eNa/EO2LQBTe/aB/8CW8RJy0YvqLidL8lAirFVSPiA/QiuF+De
 qxBKkIkrHuXZLdONF1WNRlZsN0GahjBUxgODBSJW7jnbUZzWKQEQ1LY/K329kTSE
 VxYXa8305TBuQDLlvtu+WWL3vbTukg5Hh34moERhPvzBRwopHT6JG5fgMKS37I63
 FzJlHw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btyrpkmsv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 10:22:19 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8bc4493d315so203429385a.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jan 2026 02:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769077338; x=1769682138;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ep5QnDcp6sQDu4JB5aEYhZ5VmVnyTogSqCaLPVY9tRY=;
 b=Nov0YX+Zr+uQVCJgptN0zKzZsatC7gocBawqKq67KP3nPCHIRpCS8h8dX6vM21aRLy
 anh/d6JGEjR5ZXCDWwovTYgiQxjxs+hqO1GsCT/l6K3xbthVaSWvNvdhGvWC0R+PE8Yz
 vob8VW/RpnnGrZTSLOd4CA+HZkbKfUHnvQVjMXeVefUl/lr3fQjwabt1NeqUYkqV2Dsz
 dBaXxczDPoP704SAd3VGfIyO4uZYRuuIuNfng4/k9WDGh0DZbgp4RSrUNcK3U0/Qsahf
 cMHUDvAvx/8kgmVYEjuKkHhFwN1EVf9oClc20gCjOqu0tQ7c29FsOSW4Wdv4Q4rp1Rbe
 UI0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769077338; x=1769682138;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ep5QnDcp6sQDu4JB5aEYhZ5VmVnyTogSqCaLPVY9tRY=;
 b=X/l57XO9J/byanX5u1EMvweJm0Wx0hnz4LV4puMx2JP4YpHiUaDeBWtnsMWDFnkMAT
 kX7Mbz8VYcrbSVn9nQu3yKQ8U2VRmXZ0Ue2Vfx58Ero4qlVxuzcyB5PkL9fKSZxH2Gxr
 TQODQvlzsz1+6IsXGAILLk/SxaG8MN+0fcPsGGn1lYONnJLPATlCNNsBOTZjlVVZ6MCW
 YW48RFhg3C7QImbtOc6LB23vHhJUcE35IXc4/5elTM5EwJFnUVPrm07TWtGapo9gPSNt
 J9y6ZwKGPIDJuWSEtkjU+KgajCwTv5ekNUDpAKctia4AxVpD0uFhzhakpy74evJuu32o
 HTVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnjhSY8wc+p6NXegeRwRknVMbyktb0EGMDZltAuf7c8zvjowROA25eQHUFvdVRVLNqTXA9R5koymc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwLvGSLHvdm7419HCJsd7nA2/tdinsUWxxjluxDY2BTM27zAQvy
 N94+GsBY8hSCuDawBBc3xwoxsIiRDQxn6jw2lTWlJTfCNEx0v9nacrCPUJs4L39nLTyxgYA4k6U
 /7kRRpoPS+i+PtDGSP48P3rtPHWdXmOKU07BqH4VXfA1+K4LXrxeO8wXiUeIwcPiaSlz/27s=
X-Gm-Gg: AZuq6aKPGdl3l4D6Svk0hfNh6N+kENykkd5L4SPq4XJgNC08OcmKl615X0zjeL9t/YI
 clJ56JMx4WXb0s4fxl7hWWK8rHyyoK3bQUcS2RXcvGIGvemLxFq+g4GjZyKOKTxft0JOvRYKkeG
 vMulf9pYUYzd57Omkzch7ZUqDBrDHo9JuxmgB30/DAetA5030dF0N/26ZWZneNOg+TIdl0GxVhQ
 DekjmRcR6MqIbWfv5cy8l3HAAMBcqjct+7KMIN3f+vQKBD5sw1zmg/YKmkixMeeHlviq7gVsaic
 xmad5MNDETZBAGdqh6anfhQYFrWuVimfjuivNbSo1t9PVzDGEwKlbpnl3zrqm6YRZpB5oKwsgvT
 iRS2WNH+QFnx6fw+KDOm62ZhS/5Vj1QoXO/OWqX8cOol8c6MvaI3ZNTBMzLsqsVzSMIERCjuX51
 zmCVNLvtMS+Dk3rvU4T2PypA8=
X-Received: by 2002:a05:620a:4627:b0:8c6:253d:5187 with SMTP id
 af79cd13be357-8c6a68bd2a5mr2683835185a.11.1769077338046; 
 Thu, 22 Jan 2026 02:22:18 -0800 (PST)
X-Received: by 2002:a05:620a:4627:b0:8c6:253d:5187 with SMTP id
 af79cd13be357-8c6a68bd2a5mr2683833085a.11.1769077337585; 
 Thu, 22 Jan 2026 02:22:17 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-385d324e721sm663241fa.17.2026.01.22.02.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jan 2026 02:22:16 -0800 (PST)
Date: Thu, 22 Jan 2026 12:22:14 +0200
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
Message-ID: <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: v2kLX-Lpu0mlRzqBX_WYUFI-WyKfofbH
X-Proofpoint-GUID: v2kLX-Lpu0mlRzqBX_WYUFI-WyKfofbH
X-Authority-Analysis: v=2.4 cv=KpdAGGWN c=1 sm=1 tr=0 ts=6971fa5b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=bGBrU2Q4kWqJuByW2JMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDA3MyBTYWx0ZWRfX2/Ma9+aaD4R6
 ebq0LDJ4ro8X7FzQODVDrSgCbhrgiKe5MHGmv2jFRSIYnPI5xfMsrp897yM64St7a+emnBzBvNk
 0lpS+yOYnqark577e1ydahVKrFqQ2kIZ4Aept0LPFt7ESmJ/0y6ihFX4QaPG57aprDoW7RQtqTJ
 vNbY4D3T6acWJb3bCpcPgL6wb6ym2K59HPrb1sn7g8x7SuHZUI4l3UUYyzMm7L6HuFrc1PI1wEL
 yxlZ7v6gkqqLImdATNf6vNC5hK4Ap/hzxh0ZmIpeNnCrgVbJeLAIIkf5j20M8LJiqBPDVDSGPoZ
 fdz4//PpvpEflcXGX0B+d76VLiren6vsURxeG6oLalE67Flw6NFJssRrY9wL8dlELm/zT2WyBbc
 THcf4gHKSDNCqIzgb5QZuKlLxeTerLuWdyRAlhYZvFc7K7QyqP60zeW/5L2vuhBy/MSMI6c2r6l
 mP7U4SKNE2Hvii8bPKw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220073
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
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BA0BD652C9
X-Rspamd-Action: no action

On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
> >
> > On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
> > > Currently, plane splitting and SSPP allocation occur during the plane
> > > check phase. Defer these operations until dpu_assign_plane_resources()
> > > is called from the CRTC side to ensure the topology information from
> > > the CRTC check is available.
> >
> > Why is it important? What is broken otherwise?
> 
> I see. Thanks! Will add below lines in next version.
> 
> By default, the plane check occurs before the CRTC check.
> Without topology information from the CRTC, plane splitting
> cannot be properly executed. Consequently, the SSPP
> engine starts without a valid memory address, which triggers
> an IOMMU warning.

What is plane splitting? Write commit message for somebody who doesn't
exactly know what is going on.


-- 
With best wishes
Dmitry
