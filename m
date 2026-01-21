Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIvVE+ApcGmyWwAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 02:20:32 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC0F04EFC9
	for <lists+freedreno@lfdr.de>; Wed, 21 Jan 2026 02:20:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F0910E67B;
	Wed, 21 Jan 2026 01:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EGIQMPlX";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hj1GKwYS";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7F810E67F
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:29 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60KKsQXx1037155
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=; b=EGIQMPlX7EZRAgMc
 EphulYo16uZm3gNPXZVtG6QlkM4PEm0hKFMrdC6ooiU1mFVUggTMtOaSI9AoC0CJ
 wNFSqblAJyXpTCO/5Vn21upvjgBAeAe8X3/LV2qSerYw74G38zSB1IcRSEQLM6KH
 9bPqZpPmfqH8j+LfYy6bDoI3vF913ROCJA/A1Qp48IdEAMiIdv5nkGCdOltKrR7K
 P7lU+G3bzxgDbVP8qLgJkZRIAHmQSkOBhG3kX4cLTlxEf7s7hl8b2jHBPcYxQxPP
 xikq+e6F0rO1Nb0MCW1eMag+/ESBLwe4xttPn+y2BffTvGM8nYzgXl0WVjYbqzYl
 vVCIew==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bth55grma-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jan 2026 01:20:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c6a0ec2496so1163171585a.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jan 2026 17:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768958427; x=1769563227;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=;
 b=Hj1GKwYSUMZvDyAoKSUzXaJXuQupcjH5kH2B4VlD5cDeuga65Pow8IZH622JBg3Tyf
 Fx+12S3OuG0nmizghXhlXLaK8p6mpchF62IQ4VPHHDlrq+a6iXgiMPcPxeTk12ILoZQI
 Zm+Jt7DqcLDuZAOO6uwpVY/E11r+TFbplTcMdUyvJx+Wbt3E9V5nWbjYswfOMNj6gT1q
 JYiRb0nD0E7RbvNnXcefNLDcOf3MKEFzfS1SBLaa2G4laiosQtyim6zQGzMr0PEt9vtQ
 6OQmuDLqD18TygBHXNhKxHQz6b4XCcDdAX5431IdDet9yuo7yBvJZlMpXH/26s5ByTqU
 YwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768958427; x=1769563227;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=GxiQLmlTsdvKzrs2ro8tcxJmpLG39Vy46ft+XTCJ8eU=;
 b=kLmIy+/DeEc5ujutuy2YIwX4wXUADBR8IYU/uEEcRr39hAso3F+zqKHke1SNQwJMfA
 sVEXyHGJUl7AgsfAbzljVwVV0djgmt01y/Ik56Z0xHrvfPRbug9jha4FZBhF2DDpa9ew
 6AoMzSZC4wXmnODcug8G52F9RonIzLCljv7FUYNdJsvQeqr5XmSnXG8yZazLaWzAd0LL
 nv6Pmx4EGKTAvu+1pO8PzPWrpZcbICfcTr0Q6OiS/IZyrEZDjBnXsBAy3h6RqClQvhqb
 +6GrpxFLi+tuwsQXcKeK9ObYOjG/Cfth0SzI+sVD+5TYBtDaIusKB+5Olqr67dhMf75W
 8Kyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNvWlPRu77nQAhoWJTKMZJS4Ydu/2THKF/eb7CNvrz1Pbv9Wgr/I0DEkCUCi9Cu0mY8XHfDmUryNs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7W5nv+1UeSsVSwPTrjDMwEYDwY0Y6YcAt1j66g+vfmQo+gnYc
 HkPXMW43BHWyhiPJliHech/dpgMEHOem2chbXVNHlY+VHS+tXH1bBVdTKb9zr/KM57y/pJEJLwh
 cCij9x8WPxl3U6KuQ1KKj+TYuBxuJx1qstieBHJ6eHDu/hLNYbdp2oICmGYtUDPehFjVTyY8=
X-Gm-Gg: AZuq6aK4Qb8YQtcMJoqhv3zHzEGWFs9loSewMYMp6gGlako4i4Wgyc+55kRbetUTJIb
 54DuD0265dqBE8oO8z4c0bx137GHqYn7D1qx7Fon6Bw+9XU8TYvIalyGL2RJWWo77rEP/Ki32gw
 ZgsTyf1yMldtCet/cPmHnTuDFguNbrq3xg/Lbdj1cZ0kySyzxilVwATGKOu/YE611q70Dg5Ilak
 6q+Q0t3tZIJhMd0IilImHNs5maOy0zoNJ49RJ6z8P0xKAfpveRz6CV8ptm26SoqmxhMmI13a6D7
 1nGc05c77U57xvDE9tkOAiByn0z5WeH5PactmguGy7W9XFemPVC2YzJhypKzynL+MEFooYVshcz
 L1sNTUykN2sleQmuRcwRRZDzeYM154NDVu+r1FC6dcHH0O71P2+UzqD3aOvzAjqeLrxjj4nVTLk
 pxci08MFylb81ofqXnLTjET38=
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id
 af79cd13be357-8c6a676deefmr2388901685a.51.1768958427655; 
 Tue, 20 Jan 2026 17:20:27 -0800 (PST)
X-Received: by 2002:a05:620a:19a9:b0:8a6:e2b4:ba73 with SMTP id
 af79cd13be357-8c6a676deefmr2388899585a.51.1768958427183; 
 Tue, 20 Jan 2026 17:20:27 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3543d2sm4383110e87.43.2026.01.20.17.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 17:20:25 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com,
 yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH v6 00/12] drm/msm: Add support for Kaanapali
Date: Wed, 21 Jan 2026 03:20:21 +0200
Message-ID: <176895840440.3580355.4970268867453461816.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: B9wIhzFvCQ2m6Egiws9J8bibvheP1izF
X-Authority-Analysis: v=2.4 cv=Oa6VzxTY c=1 sm=1 tr=0 ts=697029dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=s59xupi2FMclaisc2rYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDAwOSBTYWx0ZWRfXxfO+/+HtV+bS
 USX3wK/0R/ICtBRZl9pxDsEUKvoOvGB7Aj2NHaODNPArHq1/MTUdxkuB6qVt26o4u2PFhuCcaSJ
 PONIlbH5jBjdaTIrrYN79NZfGGBL6YENEegme9TOmrxfNsspVsk3YyMiYXoJOe92d6QwOR9utdx
 JhtkyLWOfL46gi2o8VTL8Gmwt74wKqjmm5I4V/rCcmJ4kvT7Sp5nLi37SBNAZmVt7U25cfJO7SN
 Y/ieaE04rM0gOhedOKDKVFw6L6TgrGau+9UtHcEl0V4N9Ufca615i0mP0tLhq5+Gat89vhk3oQw
 ckurhYaqrpKEtUYyftnEmJ+EjdfHdAACosBcxjXWNaB40hmmQ0bufYfpFaWcl19V87fja/gKeXy
 RBEZfu3+Pyc80FzjGQzM4e2+2lMRbjhA6lBQRIC3XagROn5S058+azAMF9bfbPWoeI2AYqA9aVs
 V0NbLSODJQOxDAbjqHQ==
X-Proofpoint-GUID: B9wIhzFvCQ2m6Egiws9J8bibvheP1izF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_06,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210009
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neil.armstrong@linaro.org,m:konrad.dybcio@oss.qualcomm.com,m:yuanjie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:yongxing.mou@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,poorly.run,somainline.org,ffwll.ch,linux.intel.com,suse.de,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,qualcomm.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: EC0F04EFC9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 15 Jan 2026 17:27:37 +0800, yuanjie yang wrote:
> The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
> - DSI PHY/DSI base address have some changes.
> - DPU 13.0:
>   - SSPP layout has a great change.
>   - interrupt INTF layout has some changes.
> 
> This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
> in addition to the driver changes.
> 
> [...]

Applied to msm-next, thanks!

[01/12] dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/60772c225f0f
[02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b92efcf5197e
[03/12] dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/ac9d8bf74862
[04/12] dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/526015977816
[05/12] drm/msm/mdss: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/3d2d7a3386e8
[06/12] drm/msm/dsi/phy: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/223bff623c7d
[07/12] drm/msm/dsi: Add support for Kaanapali
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2482c6f93aa6
[08/12] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/b78956dc9ed7
[09/12] drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
        https://gitlab.freedesktop.org/lumag/msm/-/commit/cc4b81f178c7
[10/12] drm/msm/dpu: Add Kaanapali SSPP sub-block support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/688c7734002a
[11/12] drm/msm/dpu: Add Kaanapali WB support
        https://gitlab.freedesktop.org/lumag/msm/-/commit/c6c9f129e98e
[12/12] drm/msm/dpu: Add support for Kaanapali DPU
        https://gitlab.freedesktop.org/lumag/msm/-/commit/83fe2cd56b1d

Best regards,
-- 
With best wishes
Dmitry


