Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NtnBxJhcWkHGgAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 00:28:18 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F425F7E2
	for <lists+freedreno@lfdr.de>; Thu, 22 Jan 2026 00:28:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6E310E8A6;
	Wed, 21 Jan 2026 23:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lpdbYA78";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kf7ADxLU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAB510E00E
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:15 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LMlF1f2727031
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=; b=lpdbYA781GOrNi3B
 +vtAccJhathnY7Tv8DoTtgLyMDS8oWWIEhOim0DftASW0deFLXViBYAEnRUUz8oB
 wX62B1552q+qpYUK9fjgDRphdHyPxFTgzRQGkIobX9WQ6sKxZdNQLxtPlqmlPKdl
 rsfTvUCIn56R/gb6Os+MvqAXtcGRLh2HZ7hfG/eX4X7372hRT9ggawwZBxqbGWWv
 Lwezhs1mmKWsDXM87vUhFfBPPjOJo77DbcittOzDU/r8xFnk5UrHG0yTmAOgG/7r
 GQuZz4cRfSYTpU4j9gOW3OZMqMwVE6PQdXRzTDXXpvC9KKSrUkXNyFJyTHWqVs/M
 Bxwvfg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btysfsv18-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 23:28:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52af6855fso55078385a.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 15:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769038093; x=1769642893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=;
 b=Kf7ADxLUx2+wFINtCXPghYLBe0Kj0ZltppyeE6T8dYTLfUtLkVKU4Uy4+4sOfrkA5P
 MJMdVVvQpqdJ/eADMJBdgo+kXqMjnp1HXLUkh3ej+6CBwEGNb3IOEOv69yASDLR/Vi06
 KPzYsMbDvYC0IsA7eZyC7uo4Zod5UwqmuBxSw91Oj5WDk/gWkNPjZwfOflH6rrXBSf5V
 k202ZM2nZem8RDNFqO167DeW1owBLNFv3IU3p+ieIjoGbLhZJ1LG12c18HR8tNNG/tNe
 bbrC8ZgioEyVMtuiXFiCwx213ZH1VffptpdnvZ3l75YW69S2rcwjONViVDm0AYsOilt1
 TG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769038093; x=1769642893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+eZGwYuNL/9pmtkPhO1CHKv5sEsHAdFAmDE3I8abf10=;
 b=liR5lhmenc8AwwuBTjSRNrUu0l+cv4ajZEZ9kmmp89ZaWA5SkFIII/wXfd4HUt3H1f
 GdKSBCPIWJHjNGrrohyKWz50+5kzO423kUhHNW1C3m/h12BBKPYX4ioM8xQStyeJi5en
 Gu94hgHXVOmUtnEqOE/MRaBcZhGpUBDQRlvqjHj8cuiOFqwDzJs2u0LB7TNQe1PN4MIt
 h1xx3pH579q2QRodIVzJ5pFLWVSL3MBPXLQ0gBRVU0W2be3U49O8EpPj/HSnpsexmmK8
 ArQmEccJjGhIFllAj80WWprbCbZxdXUw/zMoeZUsMtPJGz/mlLGB5D5aLlA18PO8ZXw1
 myug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTZbTYn5X2j4r5ZDmS60moK/BXzIdKAQPR0mdfmm9TBVUlqTW61zGLdTUBjqH96WE5oR37L/1oLu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKlawXJFrsPKbFrZ8E3O84Bz4L4L7OmstBStZZN3D8KqH3Qh7C
 +Xs6+ePkeLqBrFZpksBrj4w8aOLkLPNP5Z+AkusHyuPW1anki6nmJEDueiTyzkTYZXbrPWu98fF
 sHeS3BrLeDYkunNQZH9dvaPhuOTOI5vFx/y4jnT2yKHESjqz/msR7fyMqvrBfA+Rn6K7Ifr4=
X-Gm-Gg: AZuq6aKRrvTMLepbRtF7tTVrztJjZREUH/ai0slHU2WwPFY5z3ARIF+35v06H6wV3TO
 uQ+mO2w2idqTdmWemxXB2gUn70yMR8VOhzq2uzhu+rC2HmCsJzWLzJcbTMWYcEPRj98Snd2LloZ
 BZl3rSnynBWZg+eM07TNjQec48V8xUGFMZPACgVsncuy3+HHhfhwqEVchTLe/2M9c50LW3Cq0Lv
 LDL8JIDllIiPfyjBb2CU2Rsvb19tfuy3b1+aP0Yvnd7GB9KMuZfmu4PfSwPriiiiM+ScmGsyOXU
 LV4zMmbgM5XYLkWVKlmgaJd+yt5gMMX/XmRbBSKamjz0GwZC2eEnWYe6llD5TJLxdHrx1+SNa9O
 kjQi/d7IrhcDv22Wj05ZCAExhcQMCILadMi7a9GIeI+M0gK0DOXlVf0NIxzmbxul4RcF5yBn3ps
 5/+ge5SpZuP3ES9myWqHMhY9s=
X-Received: by 2002:a05:620a:1992:b0:8c5:3143:84ef with SMTP id
 af79cd13be357-8c6ccf06c21mr849194985a.47.1769038093544; 
 Wed, 21 Jan 2026 15:28:13 -0800 (PST)
X-Received: by 2002:a05:620a:1992:b0:8c5:3143:84ef with SMTP id
 af79cd13be357-8c6ccf06c21mr849190485a.47.1769038093060; 
 Wed, 21 Jan 2026 15:28:13 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm5159393e87.66.2026.01.21.15.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 15:28:12 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v5] drm/msm/a8xx: Add UBWC v6 support
Date: Thu, 22 Jan 2026 01:28:09 +0200
Message-ID: <176903808259.3665431.13908205509840299317.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
References: <20260121-kaana-gpu-support-v5-1-984848af12e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=N8Ik1m9B c=1 sm=1 tr=0 ts=6971610e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=75Vji5L2PsKrzm2Ba-oA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RkMNOL0ApjSjTT3aEi1QQOv7WuNFtGvF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE5NyBTYWx0ZWRfX6OBqtuwhZxFs
 D/QpmBIHW/XbecarWdTpbUsjzwu/q8TQYHcjVbNfFhBwhXz2rbjfGTz6455XJup4VhPMOTsZfM/
 +u0YDD1agsZ9T/qjOPugdK2ZVQZFGHY+aU3/4QTt615gEiNKS/FMpuu4VZ1eysaNZuovYfvBv+k
 0+UMMNnNHGIp/YRmMINQIUGjPttbMCgWnnWg3Buymq8zXNT8XItn6Uyu0PFpRaIvp71oUfMv+Wb
 QwQGqjiyUDDfKItpzFCQGuKajsldsZGZhPaqSrk5j2fUavdeZmoNF4L7TpUU27GevucnmNY6era
 C021mBfO7oXNKk7B0dqF19hZy2sc+v2vNwwWc2hqUlGe5lE+/TvjMVQXQRTKNAcO4NEz1Tee3Aq
 qr5CYpk8KzAtOmbTw9RZA361tUP3KBgvRvTl0Evi6VqMMBQ3PrETfOtCH6y8LuUgzRCKH5uDE29
 1OvNR+SvfjGc5SdA0ow==
X-Proofpoint-ORIG-GUID: RkMNOL0ApjSjTT3aEi1QQOv7WuNFtGvF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210197
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:sean@poorly.run,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jonathan@marek.ca,m:jordan@cosmicpenguin.net,m:will@kernel.org,m:robin.murphy@arm.com,m:joro@8bytes.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:cwabbott0@gmail.com,m:akhilpo@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-arm-kernel@lists.infradead.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,poorly.run,linux.dev,gmail.com,somainline.org,ffwll.ch,marek.ca,cosmicpenguin.net,arm.com,8bytes.org,linux.intel.com,suse.de];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 79F425F7E2
X-Rspamd-Action: no action

On Wed, 21 Jan 2026 21:31:57 +0530, Akhil P Oommen wrote:
> Adreno 840 GPU supports UBWC v6. Add support for this.
> 
> 

Applied to msm-next, thanks!

[1/1] drm/msm/a8xx: Add UBWC v6 support
      https://gitlab.freedesktop.org/lumag/msm/-/commit/50c4a49f7292

Best regards,
-- 
With best wishes
Dmitry


