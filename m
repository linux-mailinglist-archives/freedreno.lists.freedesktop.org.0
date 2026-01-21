Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UNFQFRoGcWmgbAAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 18:00:10 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D055A408
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 18:00:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3743310E864;
	Wed, 21 Jan 2026 17:00:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKi/9ny7";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfAQkrz8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E189C10E862
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:06 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LAKWqB3229214
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:reply-to:subject:to; s=
 qcppdkim1; bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=; b=DK
 i/9ny7u6sYA3xbSXbIQHGKSgaSeJxqF1CQpODMhYJLhS9hlss1d8e6vpsgPmAq6M
 OUCTtwcZSlrgqTTEfRp0ot0c9upyzZ3agHCzJ4izV9QA9HtfoYDsz1+5sq4xyXlV
 WqEeTKFxHUpGHzpwQV8CmihLIlOpO33U3duwJaT8uxNEH2ZY1TVo36Yp2vjOIYdW
 w8LC86fSNSGWc4GbC4oi7L55J+zLtLU3YANJ+FrrGyxmHW3uXwdA4Pt572UMyrOM
 jsedXPJ4CfvusCELtzQjx2ymDTDv+Xk75Y99HC+/uqFrouioImZBg5vX1LStwHHk
 zw+arwhsAZsvMDM2YZBw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com
 [74.125.82.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btqvpam75-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 17:00:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-2b71041d135so723956eec.1
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 09:00:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769014805; cv=none;
 d=google.com; s=arc-20240605;
 b=HUKUZWNnmELJ3jmNNI/PyCdh7QZboUiy0VmhEKW4/YfTsP+mT7HutChQYCF2h12QQF
 iQejh3I3ugUK02GrDeVwjtCNGAZ9+6f9DWeNZnhRk1oc0YNiUQp1Rgyphkb16em0KkVS
 gd04jQ7KYOsoR/ojD72r+/8qccLoZA+1or+98ZKkrv/yLf/mAqk1VuMgYA86bjyjJ1yX
 VdSRS4ytWdqXgWQ/21sm1hxT4Ena58GpMnHvJkJEzrkoQ1G+zagHm7IzyVs1JYPofNwt
 1TNUGPK2W/IcgBDr77PSlYVIpg52zqIMDbqJjWNpudBpp4YyNm1fUqZ3oWHwBvjd0F/r
 4rjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:dkim-signature;
 bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
 fh=V4sKCki4bXW7QIasyps1+vYmsj3C3oS1lU2oRxm4vDw=;
 b=Q5b6hZoF/aEz/oDvrCE2EeHZ/H4y82mkllwqBuBOJ0A63PBRo5dqzYS147uWRbXfcG
 vdWzhIkxE3SvXTEy70uPw8rz35JtwptpYdaY7o6r5NkMvP9x87ifS2vJJFx5w5WUPN0R
 bDR1cq7dMqYDo+DVIgbUR7iLzWVmVAq3KDWJ+TMY5HjAdtQDotGQYTmyda2zu/wZYfCN
 vZT6hUTY/KWZ+k/kpGo40hQDY8SGgxAP1P29YUzo64Ytvx7vy5lZzAx7tyiGeFMitJ8n
 i+vbtv8K5ZuNRmq9D84p0yI5wR/TXyODx8nUFaHZdQU9Y+A+FNxZlm8mI1GYBREHOlz2
 akTA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769014805; x=1769619605;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
 b=QfAQkrz8ZFc6xdJSO2dD9Ezw4k6YI74TJy3BfDdNIvWSru3xxhS2x1yMBF4prkP/Rd
 5uVnd8rKrirF8cAV9OOc/cmQdGxdlykPmcgbAN9svbTIydqp9jvq98XyCRF+/JAqeqWV
 FA2W/80BBhWqxtW/vswUneaTxtPoXC32GcpkwKE+s0lg/83wiEVn6mty2q5GGWGj5oqg
 vnYGvfW+pawL06FRXRIwBrOD97BZk6smawV9GgYe76iCykUiRBTfU9CKYOO8bAu4dhHl
 a8+zNI75bfWn0lecUNpP6Merb2ANB2vVGmLvOokmDbiWWvYPPjl9ERZzOf7wcY/WH4z7
 LI5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769014805; x=1769619605;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Of1XCp4w1IY/FWfBQqk2YMMCDqdBBDLtge107x8YzfQ=;
 b=vdYQKNLa7Q4BRXJnAs1fBNxzrFDli5fHYhaT42LwGc4dnCd7EH36jSReTyAVkuYz4/
 WxsJSqUQZMikd/sBBrG1c/tqdcqIi27anLrrZBZ3mihem8WLMmz11kQgGTIcVm33k23s
 A/hvCrrbIO/LCdh8UqeODCFzrMSto+9IZrEyILW0+Pvg+jFTERgQt1qs9f9fiO6x9W4m
 vf0NQDcHglCWdyNH2HNDhmczqVzr2Stpxn1VjWH9a7wpoROOSJLm0HggLl7vEPTeKVpd
 +hRkXM5NkIaiUbSWRtTSd9A5RL+uoconwOm7PMfHD748mwri1F7yc548lccM558/wv1a
 S4fQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlelthjBwVUC1VHtgd/JukAr0LTGKmxs95/iO0gTUG/Y63LaK2NuTzp73he/wd+QuMqreTvX74pN4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzm+iewXkK5XunWzaaxOlGf9WucUE9BfGKw9TFFzqGWP5ymDvrO
 q6tMJN0rclvqVINU4NL5KFeWSqzy9+yYARBEql+Vw7NiNzb13pdEULz+Kb+K/UH9a0tZCEatb5t
 XJlXPVpL8PjJ9z+iHcVqsI03dqPS7g/DgJWISVCakdfp1lYbd3wVebs1ZmUMO9cy6K39RvgYQ9x
 appecrJcYBeW5gwa81uB+lpVAkeEaUqy6EUPWhArSM8uLC7Q==
X-Gm-Gg: AZuq6aIzIkGzINo8ed6UE7f5FWZCyZ410bHdRi4/TTCFnoc/hcq4Rc7JN1IHZesy0j+
 AvMOvaA0V5IRl5xEw9yD4QkO4/fdRThCMxgP/IceU3Y227Q3VjalXFf3hvPNVcSkjHCYOkogAS7
 5rFj7faFBbIVW5uohUhuwEtpRNVgFsun1ykpu+aIGyY9jVpcFbzeus/4vMG6Kqa7bitXnslsy2c
 hRd6ii6/dG8DumxB6LaP5blNA==
X-Received: by 2002:a05:7022:a8d:b0:123:3c24:b15 with SMTP id
 a92af1059eb24-12476b1215amr24647c88.19.1769014804741; 
 Wed, 21 Jan 2026 09:00:04 -0800 (PST)
X-Received: by 2002:a05:7022:a8d:b0:123:3c24:b15 with SMTP id
 a92af1059eb24-12476b1215amr24635c88.19.1769014804017; Wed, 21 Jan 2026
 09:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20251221164552.19990-1-johan@kernel.org>
 <aWdaLF_A5fghNZhN@hovoldconsulting.com>
 <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
In-Reply-To: <aXDt6v_iO4EFCqyw@hovoldconsulting.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 08:59:51 -0800
X-Gm-Features: AZwV_QiWj0yuZPjfl5AAb2tqkVbhX91Ozb0ASrKflC4IjkW86-eixAz2tomYpLw
Message-ID: <CACSVV039g9CcAKhtMAwn=hH4hMT2nV77vxiasgUSFF-sn=+JgA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: IZHGaeaMIlGKzZW4a32eOwHvnjhLfjrG
X-Proofpoint-ORIG-GUID: IZHGaeaMIlGKzZW4a32eOwHvnjhLfjrG
X-Authority-Analysis: v=2.4 cv=cdPfb3DM c=1 sm=1 tr=0 ts=69710615 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8
 a=RcnqT8zevFU4LWI_uFIA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDE0MyBTYWx0ZWRfX2Zw2LFB6eZWh
 n9A/Cz1OxvHxOGL4nzp2VmaVKT7/gjXbFFTLQ4OfhwN2jFdUw2IPEbtrT1gC4bJK6Cvb4WFENy6
 /61oro2HM7qVZ+hp+ytiZj3zCHs/3IR71jH1HNopBpUpwCIe+KUxYhh/gt0ZH5ZKXZ5BNrWlY/Y
 CcnsFNhgUv3XvHxiFE50ucl0Kbas8xU1ebJtel4WyVNHyFzVgxda9oLpkpqPUjMWMZHwDiLKgWk
 xGzHoKNRX+Sr8bYCcqjBmo7r+V78J+9c+mTR+que7kAzVFiNVcGBE4AXcKFlu5chXLij2fKPfvB
 600kIU9Uejym77Je/D+8yKJcZFU+Clmg7eIeNMk7uVxlHBebmWiAZgtImyzeE/WH/RtLf/KWC7s
 i1sm3dXpJ1VgMRR+6/6aPDLGKSTHKWrLmz46p8xcKFP+YLzz17aLHriAO71gnYS0jjB9YKt7we1
 w2eRgXbgxwFBiDzloKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210143
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
Reply-To: rob.clark@oss.qualcomm.com
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[google.com:s=arc-20240605:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[freedreno];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 64D055A408
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Jan 21, 2026 at 7:17=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> On Wed, Jan 14, 2026 at 09:56:12AM +0100, Johan Hovold wrote:
> > On Sun, Dec 21, 2025 at 05:45:52PM +0100, Johan Hovold wrote:
> > > The hw clock gating register sequence consists of register value pair=
s
> > > that are written to the GPU during initialisation.
> > >
> > > The a690 hwcg sequence has two GMU registers in it that used to amoun=
t
> > > to random writes in the GPU mapping, but since commit 188db3d7fe66
> > > ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> > > the updated offsets now lie outside the mapping. This in turn breaks
> > > boot of machines like the Lenovo ThinkPad X13s.
> > >
> > > Note that the updates of these GMU registers is already taken care of
> > > properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> > > properties on a6xx too"), but for some reason these two entries were
> > > left in the table.
> > >
> > > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> > > Cc: stable@vger.kernel.org  # 6.5
> > > Cc: Bjorn Andersson <andersson@kernel.org>
> > > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > > Signed-off-by: Johan Hovold <johan@kernel.org>
> > > ---
> >
> > This one does not seem to have been applied yet despite fixing a
> > critical regression in 6.19-rc1. I guess I could have highlighted that
> > further by also including:
> >
> > Fixes: 188db3d7fe66 ("drm/msm/a6xx: Rebase GMU register offsets")
> >
> > I realise some delays are expected around Christmas, but can you please
> > try to get this fix to Linus now that everyone should be back again?
>
> I haven't received any reply so was going to send another reminder, but
> I noticed now that this patch was merged to the msm-next branch last
> week.
>
> Since it fixes a regression in 6.19-rc1 it needs to go to Linus this
> cycle and I would have assumed it should have be merged to msm-fixes.
>
> (MSM) DRM works in mysterious ways, so can someone please confirm that
> this regression fix is heading into mainline for 6.19-final?

Sorry, mesa 26.0 branchpoint this week so I've not had much time for
kernel for last few weeks and didn't have time for a 2nd msm-fixes PR.
But with fixes/cc tags it should be picked into 6.19.y

BR,
-R
