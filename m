Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIHWHfoXoWk9qQQAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 05:05:14 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B91B27BA
	for <lists+freedreno@lfdr.de>; Fri, 27 Feb 2026 05:05:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90C110E188;
	Fri, 27 Feb 2026 04:05:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ONcJveXH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esDWpmzn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9302110E188
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:05:11 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61R2JxHU1873163
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=aiD+WIJ/4DuL+WWSgSV75vtj
 gYSQFtjkrfw1dFQwWJc=; b=ONcJveXHd8QgGfEnYdh40lzZIUo5KO6WAx2jz/1F
 kwDYmXd9Zgz2yq51hS62AJRU9YldniH1kA/MieDutASQg6PDUhO8tDzDbc27Wwee
 k79zpypiFo4hyxSgeSmVnxk3BsxbRpcemKOxrADeOrf+TrEgCs2nlh7h8h1RC0Yz
 KEw9DuUeFp8Ugo4Pu/fP7Yrh0kYjvAG9SEOpd7FoK5bINfx/RlgCTQIl70d/q30x
 eL8Wv1oZEVm4k8ZENNjB70SkYp1wOWQGAWb6CrzC8f8WA8eqSQnUmehBczaAgZ76
 qetJi6IVKgxzl0zfuFgS3BaO/Ad0Puq8C/xS7ro/qhJY2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjuytsees-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 27 Feb 2026 04:05:10 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8950562d351so275888266d6.3
 for <freedreno@lists.freedesktop.org>; Thu, 26 Feb 2026 20:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772165110; x=1772769910;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aiD+WIJ/4DuL+WWSgSV75vtjgYSQFtjkrfw1dFQwWJc=;
 b=esDWpmzn7lnYZKsePZltElPOAn9D/QnMfsygYwUnHqXJeETxBuFUXkuS7ZVO9mA9qM
 7WVIxFESz4smqLd5aI/lCYeOrcYtlTgNMAQewub6jBgtLEXtiz4kD8LMKpYTx0bL7X5L
 HcLIQbrtDR1oMzs5grh7ET6pu65y/4tIM2w5H4LAF9vHPF/sOHnXyFgA7N3C3MNV2A7F
 w1fYmVq4jn7/QjTiwCnTPEUgjG1FtUgn/J+HOTZldFgypJxLIp0FnmJa+uIOAtP5aXIK
 Wd1q1P/YogxQNeGN56OkrHo6y5iQQy/8ZWraElVMqcp4IgBpYvI+yPy0emABoLmaYzL/
 Bmzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772165110; x=1772769910;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aiD+WIJ/4DuL+WWSgSV75vtjgYSQFtjkrfw1dFQwWJc=;
 b=ifw5KJx/RioSMO3JDqGjfQ2LyyQwg248ly7IbuOrGj3vMuNT5k2qbBAt6gG7ThcyMq
 Qq0o8KVnu0LrPoRIWLTxEYOBlY11ximidTzp8BdlZyr3KUIW/H1KZFiP8h3nXnkYCiw1
 UKKs85xAZNxivGaD9VQ+LZXv8oS10HlhNgaSz3iHttcbHV940vxBMSwwRQ6pjgF0x5CV
 5mbwx2hSAAnwfFUU6PlAK5qZP1B0kJuxR1V0Uyk2YaN+zdD5tGA6htrI8U3gsjaG3tyy
 1vUr6QoNrKzPmXxDyf/CKAa9OEZ7Ol5tm02Yony9XQl02BwSTCT4OpzHLRt1RbVDKVGx
 IEZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMHOz4cKZB1fu0US0A3HJ0LEWg1rgbmwLdGDyulDt3cLEuDj5SaOEtUy03cTkKy+3pqu9w0FHxkjU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz9QnJbrTCgEc8PFhdsENXuywuUKfQHdtAGENYVvn1jn3fHy5DX
 J5Vy4gRVUOsyKiP1LSqKcrCshgunvhwImhNzUDJBT//AU/B4vLF59eqHq6j4jeAV1YrgrUUnrWs
 25OuP97py+29RlJaW6CI6lic/T0BrLwCrkM9e0e50H5e0FiyyOGklMXzeMfnX+V71xHM8WGg=
X-Gm-Gg: ATEYQzzxgtfasB00sBwnuPDe1blGZ/m3dG/KiQSfmSRQ0c/ZFA3t39VC6NO5oxbYUdo
 BQdkk+f7edlIrh8N7xF0WzQ+kKoHI4ygblTcJjzPz3FxppdjI4YAHn/oR+GaBvZWGd/EmgGBZwb
 yKoP1E+CxYMiMzO8H2X8Au6gWLU8O5leeKcH6u8cxShuJDmiYRtUvEQn/Y8hZz+aKiYmCIk/3K6
 yOukNZruKG7bgGWiOVcF/5lTE609cjR9A/v2B0fitVb7IYE/TVVLjl+B9m3rMQgW8KxpNRYzSgZ
 FxDPkaMbxfpHq66OJxjNZwiAjx0O9ZWhLmas+WbeWb80Jmcajb0Khp77HkNebICKsCYsC28OGav
 Mhs4h2J+PNNUyHogoc/m4mOtVT6v+qiTMaRnOzgu0TFoyizPuMFKCLxEZGnFfBUf4MXMKSZymd5
 Myc8t5VUSUs6baL1cRMx0AUNLpaXJPgpEMADY=
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id
 af79cd13be357-8cbc8d6f18bmr181036585a.6.1772165109943; 
 Thu, 26 Feb 2026 20:05:09 -0800 (PST)
X-Received: by 2002:a05:620a:4015:b0:8cb:4d9b:6b48 with SMTP id
 af79cd13be357-8cbc8d6f18bmr181033285a.6.1772165109483; 
 Thu, 26 Feb 2026 20:05:09 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a10a30d9a9sm1563193e87.52.2026.02.26.20.05.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 20:05:08 -0800 (PST)
Date: Fri, 27 Feb 2026 06:05:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: rename DSI_PHY_7NM_QUIRK_PRE_V4_1
 to DSI_PHY_7NM_QUIRK_V4_0
Message-ID: <2n6kr37xbovx77o43nk2j5fuktbes5v3itsiw3lzk5wxupfkb7@lces3sokaonr>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
 <20260226122958.22555-3-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226122958.22555-3-mitltlatltl@gmail.com>
X-Authority-Analysis: v=2.4 cv=bJIb4f+Z c=1 sm=1 tr=0 ts=69a117f6 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=CDaHCIWj6aTna2qagqwA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: pYrMk8Z5Hosk2sbU7id-n9fZip2B0ZFK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfX8miS5SUI0yHF
 aV3xRc7bMylqPF039EoQs6aiGLa8OgpNA/g2XIMq/cvAEsZ6xg/l3Iqq8tlNL9s8rfg5pK36VAx
 Qpn1rBHWvfWj2lWpcb+dPhCNYkKkuMVqRT4/r3Vie5IiZmgFP6FM3gxNN15HPesoEZKke9YPG0m
 1+JDlQguqXca8HrybyWT7MvLGhrLA5ICQwdYvutKVlBpvwdxFAkrtTxUgUEuP1RPuQwZzOpGglz
 OJrFR2mvjh75QPblTCuetoxSSyYYwrZJ/JSO+NQ785E9jANPoAii97UENsNmf5MhsVDDQNLcyld
 MkYy2HSltwIH4AHIEIv2yF6OUCnNJTdWYfwV91IR4f52ttNmDdUpRao9h6EQt7tSKK0e+VyI48U
 8FzllktueBDwkIYe8uRt98LOljY1sFHRC/Ry+rDeIqjTTrZb6IzaZr32qvsATCwIE4E9ZmIJ37b
 eYeisWRReNn86wfWCrQ==
X-Proofpoint-GUID: pYrMk8Z5Hosk2sbU7id-n9fZip2B0ZFK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
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
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:mitltlatltl@gmail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:broonie@kernel.org,m:krzk@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 253B91B27BA
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:58PM +0800, Pengyu Luo wrote:
> The quirk flag DSI_PHY_7NM_QUIRK_PRE_V4_1 is renamed to
> DSI_PHY_7NM_QUIRK_V4_0 to better reflect the actual hardware revision
> it applies to. (Only SM8150 uses it, its hardware revision is 4.0)
> 
> No functional change.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
