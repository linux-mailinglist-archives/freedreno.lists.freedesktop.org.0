Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMJtMhCIpWmWDQYAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:52:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E721D9309
	for <lists+freedreno@lfdr.de>; Mon, 02 Mar 2026 13:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 510D210E4CF;
	Mon,  2 Mar 2026 12:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnkQCPdu";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G7ocF+gP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E3110E4C1
 for <freedreno@lists.freedesktop.org>; Mon,  2 Mar 2026 12:52:28 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62285Xpj662196
 for <freedreno@lists.freedesktop.org>; Mon, 2 Mar 2026 12:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=PY/aFPmpxL1Cv4MW6Rp2db4i
 u890188ul3o8vC4hqY8=; b=mnkQCPdudJNKqTfUxFZZ1006pFADQe1v2eS+r1Sr
 eEDZq7uwdqOp4QB86aw4pG3nLQw6RvSg24FaCfalrErpQatqxPiDQeNWJ11SMSo1
 39dFnWArmrkn9wAzK25dKvgp/s1SbzK+h839axGgvFvsC9+TsqtqjZwcJpsgiK7Q
 0U7S9T1U7zz4l2PizQUql+TH+UScuKznJcr1c0E467qEo3f5UzaqWMKgm6G3WBis
 E0TcBgdokfoX2N7/ET7YubNLQCaaVujcR9cqAFRgyA+R1q7CHcB8knRzjqBDSHpr
 wxVoE0yq0WWC57v0m2c3O902lUBKaly/HDXH9SPbQ7gCAw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2s1jh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 12:52:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c71304beb4so2773835185a.3
 for <freedreno@lists.freedesktop.org>; Mon, 02 Mar 2026 04:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772455947; x=1773060747;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PY/aFPmpxL1Cv4MW6Rp2db4iu890188ul3o8vC4hqY8=;
 b=G7ocF+gPPcBND42zZ1EwFHT5B4DAS0WJJV+TtMTP8TTNo+gKo1NfZeNCYTEm3/ysZ1
 Cp1taiVBRNUp4XAQmDBzisIBR7f3F8xR2COJCxzysCN2QM207Ryojpir8awct7BXpR8h
 QgEWymbPftO/EIOFLEjMFrAeNGcbeaWBY0uUqLd5wq+JvIrlnLL8rFIzAnPgqB/IJ24i
 GBL3TTUjbEkO3LcrL+haIzO2n8UIoJXTWr8XY95j8BpouJEYIVqvSkomNs03iiuhRLfm
 s1iwXFjl+/oqdBz3tUMHLr7RrTsmmulcdjrHa1uWKHcQJJXhB9lQ8nFB3J4Dhd3dfjuX
 HeYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772455947; x=1773060747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PY/aFPmpxL1Cv4MW6Rp2db4iu890188ul3o8vC4hqY8=;
 b=myKpUI4eGqQ+L3NzyKKVE81xvsXQr08ikJNT6ftHNtzoUhUTsRaiXOuTnI1Vny74QW
 oFQyZ390DavNuheaZ4zfqDcx2iJN8SU3og5i6LD5wrMHv5vPWpoGX5UBsFt9FZizFjmN
 X6fE46DSCST4IhvHl09XVftZSEVjDaYhj33fVZoL+IpdFchliP9ZnA88VcQDFGgiAO88
 HiD//t0XjM89MzbBAPrHtw6HPLWot2E6nIyFjsPG4ovWJyWHsAw4Tx+bXsqcS0uMVy3y
 3/qBNIELje772ulgw5dMwANOSmBYoVcTLEKERUuK9Uom+BR+pnS7cAYzPYhrTcXFxH66
 qABQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVELUD5RSCiVtpMtg2kLrrxyuRQkOMBQZp4K6M4S7BM8w0uFmwtustEnNOeEfbS9fsk522FJ0z+6Rc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yznd/wWj6uJRkbyeWTwze1b9xDjm6jwTa1BlI3xG52B0Gw9CBIr
 zdjmrbmdYftPPrL8PEXqqs8RugQ0fcYK8aYCliom3O6cCHgU7iupI2H9PfRLUuPs97PoC0oHzfI
 rkONUVfLyZWhqlwWUiuAlJZk6J6FJB8juhzXgjb7939PEImkxiR3xmWoORNM7YjO9WqhsnvE=
X-Gm-Gg: ATEYQzwB83rvpxsfJAKQ6lA/tocGMs1/kpHfRGR0xeYuJUDwQvFwXhBBVoSm9U4/s4d
 cIfALcYBMLwoul3MpU6GXNd9Mb8arRtgg+kZqklIGvFAz2RU/b3250ReHcufLjoG2lBzJxrqcYe
 SpZhYo+7zpel3gMIv/jy3S+8M9xZNIX4EZ3Zq45tQQkOkHNTFJkbIIY5OmjBn3lDiWl9u/amjAY
 lkLfTICxtO+W1npXnDaku26EnlDv10Cdn1DCwRkKyc02i0SMKtBtv0YRfOH+8Q5ceAeU8kUm3yq
 lwctYOI92tI+trt0YvpTqRiKeDxZzbhE7umrvOB+xF/aTUt06LeegTE5DwuTP5qSexZo1jbYRJJ
 /4XjTEXMOG0U+IVHuNt9GHLWdge9NfM73PIZ6Uf7kOF19OrNWQVAFFfhsAADyOJrkfmNQCeirrv
 8eLP7jz5/QhhdrZqO7anBQkW9nQ0XWowIv0u0=
X-Received: by 2002:a05:620a:4041:b0:8c6:a723:77c with SMTP id
 af79cd13be357-8cbc8e2ce2emr1527901485a.60.1772455947277; 
 Mon, 02 Mar 2026 04:52:27 -0800 (PST)
X-Received: by 2002:a05:620a:4041:b0:8c6:a723:77c with SMTP id
 af79cd13be357-8cbc8e2ce2emr1527897585a.60.1772455946843; 
 Mon, 02 Mar 2026 04:52:26 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a11c857c5bsm921805e87.62.2026.03.02.04.52.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2026 04:52:26 -0800 (PST)
Date: Mon, 2 Mar 2026 14:52:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] drm/msm/dpu: simplify VBIF handling
Message-ID: <lpydx2i46dqbawmbm6pgst4bc5gg433xgdsfm2f7zdpdn43lil@jeuavkqivp6l>
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae03232a-49da-431e-baad-c5ae7b85eccd@oss.qualcomm.com>
X-Proofpoint-GUID: MNoSb-DL-OEfa-sx6WFhrsocyKsKQGfZ
X-Proofpoint-ORIG-GUID: MNoSb-DL-OEfa-sx6WFhrsocyKsKQGfZ
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a5880c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=xMFMbcVZH8Q603apdYEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwOCBTYWx0ZWRfX5jqhRTgf2WkA
 wzcNxqCnCTDWR0EQ3iY2z4EnuLeLfU/3ZHqHKg+rKhzrjqIGPErfhMDertSg2fb9MFINulKykDF
 dB8qxNNC2ntzO7TPh/ZgrE7wlsch6NNCT+TMkUkzwLG5JOms+1sM8wYEa2Jf0xHUmtKhuH1wM1y
 iy3tjQ56yTBYUuJvjllWWBbpNLge+QzSFicZ8zEjvWXO8mtyRFWtiwJ1KWDvpJe8HuA/g8p/wA/
 tk9f9FWkpkr08Hh0GzSUZKWRRkNCuuSgj/Kbzrbvf/EzRfprKe+R5DVc9FPyMo67f0GUB+e2NWg
 8Gew+PVDoJvssFS7m1qqXDsWy3klWtkq5kbN1gip0MaahhkuM+8KDfznNOEF9i2J39SIGSgm42+
 br/GCx2kL05e5DshNJ6HOJHzcyKjLhcAYg2NWLCeGAYnKnk4nTSaZnmZDt7E0aMDqkdLRx9nGQH
 ZbtPiMmhVZV/B2rnFKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020108
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
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.994];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 34E721D9309
X-Rspamd-Action: no action

On Mon, Mar 02, 2026 at 01:45:39PM +0100, Konrad Dybcio wrote:
> On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> > Once Konrad asked, what is the use for VBIF_NRT. Answering to his
> > question revealed that it's not actually used by the DPU driver.
> > 
> > There are two VBIF interfaces two memory, VBIF_RT and VBIF_NRT with
> > VBIF_NRT being used only for the offscreen rotator, a separate block
> > performing writeback operation with the optional 90 degree rotation.
> > This block will require a separate isntance of the DPU driver, and it is
> > not supported at this point.
> > 
> > The only exception to that rule is MSM8996, where VBIF_NRT has also been
> > used for outputting all writeback data. The DPU driver don't support WB
> > on that platform and most likely will not in the close feature.
> > 
> > The missing features don't match the extra complexity required to
> > support two VBIF interfaces, so drop the second one and all the options
> > to support it.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> 
> This leaves a trailing 'bool is_rt' in struct dpu_vbif_set_qos_params.
> 
> I'm not sure whether/if we're going to use that specific set of functions
> with rotator support, but we should probably retain (and at some point
> recheck) the dpu_vbif_cfg->qos_nrt_tbl data that the catalog houses

is_rt and qos_nrt_tbl are related to the WB support, so they can't go
away.

> 
> Konrad

-- 
With best wishes
Dmitry
