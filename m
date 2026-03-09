Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wATQBo4mr2mzOgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 20:59:10 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 668482407C6
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 20:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C4B10E598;
	Mon,  9 Mar 2026 19:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="g8C4jeNW";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I9DlCe1g";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01EA610E598
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 19:59:06 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629HBhLZ1659813
 for <freedreno@lists.freedesktop.org>; Mon, 9 Mar 2026 19:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=mIoUic/ArDby/rEar6KZzxq8
 OQXv7K+uT63AuQr9DIE=; b=g8C4jeNWn7PzEIjNKCHjlS3JytmuGSIMPwH0pBo3
 CPzHFs8qagUNompx7BXc0RIDITKUjcT3enPh7SYVDKjeGnCbWAFO9+PqJ4Cl9HuC
 TUbq1a05wKS9zHCVhFai5Tq3Hoem6Ic07QNdZn0c7TwP7atzoli3Y0d529vN7jkd
 XGCpsh4WIq8wivUrRZIyVtnhxoTTWYhPBUy75T/yTSNMZK/zY9zVqJf/clcNhyZr
 XEMuHXHef5c0aiHVGs2T0zhgb7iU837pdgopiVSnD3ZsHodzsfnYSSKiAN/vcPXw
 ryB9irDIVUBrxZC5rFrUVtMWhmfmy+EmgUM7m13wJAbsow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyr414sf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 19:59:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8cd7ea0bb20so1050076085a.3
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 12:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773086345; x=1773691145;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mIoUic/ArDby/rEar6KZzxq8OQXv7K+uT63AuQr9DIE=;
 b=I9DlCe1gz2wEChynS9zsePLB5U2eDf4lCJ7mZ9amXzMpclMihjYb3T83j3468hZO0a
 yn2XYceWRA1d9iSUItivJt+KmSVXWX2xzbsFcSOpxJl/3qvqeMVi08H4B9ZO1NWOpI3N
 ZV4QfyRfLmjx8i+nnCfAKxn6QJPq9PoVRbuSZi6YIjJLoor1nP4eJnxtWy8ot8APyTwn
 nq4tnm9rBXu1F2o9a+JgQLuq0xRVutPwrXuBbNbm10d/yb9Qgz8tL726L8IlM76V20/x
 4XyU/fAClnB4jVqDGRNPoQs1BCnfogFT9VZR+FXlY6EaymWVMh2kWw+x77wgbzRWW2mK
 xLfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773086345; x=1773691145;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mIoUic/ArDby/rEar6KZzxq8OQXv7K+uT63AuQr9DIE=;
 b=KumZjKdH46rlv3ySgGPN7+cF2NPhb8Oo95sAlRAYBoxp2Ayvg6Gqx93U04JUYZYUu4
 R95kdZ2QPuVVncEt644IuIQYI7c9f5LkM5VicjNw4xg7/hxvbGV0yDtQYsDld1JFjbUS
 cb8YkRUd6qjuTpfFDaGD7PFSzQ29h6eDkrNH4lPFeMii49tXTYIQW3bOKtZczM4u1qjf
 TTs/87ALYkOD3fM3QdaiVpQ2bPqyZGjn/Y7HNMN434e9ZBs/hCVjpxW8WbA6PQrSNd3Z
 ZNw9zhuw8KNSGC6XVkOslC9GlVGImbYHDGKXwVQFLhsTA0xoEn472kSoZvDc/4ECjEYA
 dtxw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe1voQSB6EjJMhWMUkiXRaYQjFebR9OiA2taZHElIR7O2oKyvsqhiDCBeGUT2jrO0mmAO4sIWuG7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx5Kw3A48+2Zi8yK1YZA0HDGBFXitDpybjxKOyXhb8UrqfOiuSg
 2QlO5fTz3GGvYDVhlPJCEaj2T+lslZXOyQg8EIP6uzi5XnZ57QhWDOnACC6g9joEAk7GrZXvo73
 KkTSFXal3F14iXdi1lsQL71K+VQsRArCZyD94pIlEpPj3OauKWrHXp1NQQblJGTBOzPG7lRs=
X-Gm-Gg: ATEYQzydCU15DOIJP8wTSSh+Ftet0RMZHsAZn5Je+k/RgEq+N/7S8sYCkpjEG/2Simh
 U4D95t6DBXs5nIWxi/kMPqBQ9oYRsnDrbP3+55qN6fcaDS6idtVFJ2J+rJ4FkWPndaxTvTOaGML
 or75ErAQxgyXUwhsYnrLv+P+6BCMnOidqo9zphy1CvniriDBgdvCnRmgjnABslbN0I9vV4jk0/F
 3N9ucsOf2oHnt5E4G1F8egOdf0B+cob8uRYoCO/LKkKZJewanAixhw83QlsiKWEzA5c2+ROW3KP
 I9JkLSS97xwe2N1mtiVD8mCdSx1dxhOI8zozS6McOkP97mnLtmV7w6cG3yTSZcSwalXdmZrWVfu
 UiMaWVVRVAEVkNR4v5t8P7H+MskKGkDELcEjhpEcwlLW3BG26O3z17U1z2j00j2tCwLBftRQwIP
 bTrxWcKEya7uiuEepYUVGllr+EYJez8ACAmFc=
X-Received: by 2002:a05:620a:7013:b0:8cd:827a:2abf with SMTP id
 af79cd13be357-8cd827a36a1mr857658285a.64.1773086345152; 
 Mon, 09 Mar 2026 12:59:05 -0700 (PDT)
X-Received: by 2002:a05:620a:7013:b0:8cd:827a:2abf with SMTP id
 af79cd13be357-8cd827a36a1mr857655985a.64.1773086344665; 
 Mon, 09 Mar 2026 12:59:04 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d07e015sm2393313e87.46.2026.03.09.12.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Mar 2026 12:59:03 -0700 (PDT)
Date: Mon, 9 Mar 2026 21:59:01 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v4 0/9] drm/msm/dp: Drop the HPD state machine
Message-ID: <iwde773odhwjzfw7uzugkh3pl7f422lvdph4k3ycunrlpctost@fdzvu7waf2rr>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <f1e77005-8af0-4628-87ea-b38263418bdf@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f1e77005-8af0-4628-87ea-b38263418bdf@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDE3OCBTYWx0ZWRfX8VqjDh3aFRvC
 p+SIObnZ/oes5rGzqi66EcSVexQhEp1YlIY/eEDlzn96hbJqrMghz/48NTjeFHGfbFbbstnSFA/
 zY1XtpfDTV5BqJRt4tbRUlLZ1RtBl5M1mMEoSh1oEuyKJW0+jVlpmHEOXYlmId6slr+Gg0aND80
 atgAs2mFV8iLCMqMtorU3jTY4bp14KLthXGigcgs2r0bL6EM+QcrHRvMJZgLm00Xm6sOyFcTPZ6
 5Tk/KwYYZPC8E+56zl13SJ79kGXG56M0cTkUcY+NBfJJYBqM6irY6fh/Sbnrg3SZ/SVaZyfK/Lo
 5KO8ume1WI2PP+KD8B9zHQgCdQupgU9taNjdqfPwf4LfVAuczQJ8mF+zILQf9AdzdBYM5ph8+g0
 Qq0Ul8otVEUUoZGihMBV3Clni8zm0EBWeThafjznh5M+IGI/FXEkNZqJf8D3ESHVqBpqYOi/h7P
 MHVJhhauoRHLVKU8/hQ==
X-Proofpoint-GUID: jHNcZhnSHLTzRyvceLY-7T4goibACCsP
X-Proofpoint-ORIG-GUID: jHNcZhnSHLTzRyvceLY-7T4goibACCsP
X-Authority-Analysis: v=2.4 cv=KNRXzVFo c=1 sm=1 tr=0 ts=69af2689 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=e5mUnYsNAAAA:8
 a=2i3PJfWd8q0j2ReteEEA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090178
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
X-Rspamd-Queue-Id: 668482407C6
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 01:45:34PM +0100, Konrad Dybcio wrote:
> On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> > Currently, all HPD interrupt handling must go through the HPD state
> > machine.
> > 
> > This has caused many issues where the DRM framework assumes that DP is
> > in one state while the state machine is stuck in another state.
> > 
> > As discussed here [1], this series:
> > 
> > - Removes the state machine
> > - Moves link training to atomic_enable()
> > - Changes the detect() behavior to return true if a display is physically
> >   plugged in (as opposed to if the DP link is ready).
> > - Remove event queue and move internal HPD handling to hpd_notify()
> > 
> > Note: eDP is mostly untested. This will be sorted out before the next
> > iteration, but it will not affect the series in a major way.
> > 
> > Note 2: there is an issue with the DP connectors using GPIO for HPD
> > (rather than using the nativate DP HPD pin), the DP will not detect a
> > display if it is plugged in before the board is booted. This is not an
> > issue of this series and it will be handled by a separate series to be
> > posted today or tomorrow.
> > 
> > [1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738
> > 
> > ---
> > Changes in v4:
> > - Fixed PM runtime handling
> > - Fixed several cases where the HPD machine would loose its state
> > - Fixed the case where detection was ignoring the plugging in display.
> 
> - forgot to run b4 trailers -u

Mea culpa!

> 
> (no worries though)
> 
> Konrad

-- 
With best wishes
Dmitry
