Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJjtKY03lGlpAgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Tue, 17 Feb 2026 10:40:29 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E9514A7E0
	for <lists+freedreno@lfdr.de>; Tue, 17 Feb 2026 10:40:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11F410E4B2;
	Tue, 17 Feb 2026 09:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZqfWP1wB";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A2ni8cGe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1900210E4B3
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 09:40:26 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61H0joxL1067216
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 09:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=; b=ZqfWP1wBIW2arHQv
 fmq26m3UTL3/49uN6OX74gSV69SE3xlZ6E7v9P145qVphbD8lLJNTzaAlSA14ya6
 u4ZoiwNpJrMW+2NaMPLwpIaVbzvpv/mKD2/8rIy1AX6Md5mcDHM14Gdfd97f8jYI
 ojE4SIHmDDz4oiF/Y/GYAcUNXAxv3FaZxx7DgJHR0Raf/RekAZoZIoM5toNo5fFo
 yhAzainorf4z8gpk+u0rWFqoTj5kKAADnZ/CynFx2+mBPdd7IMOMY2RZirSCe43v
 besRIIv1VQw/tr4f6bP2QK8mVWZn8N1xAij/xxK+0F6eNhM94hFIFaoxocge5yBv
 jnfDdw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6d81v8y-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 09:40:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb50fb0abdso277454685a.1
 for <freedreno@lists.freedesktop.org>; Tue, 17 Feb 2026 01:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771321224; x=1771926024;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=;
 b=A2ni8cGeowc94aN/AKzXBwDpV9SWm1SVNIGioWohdIRQNxvJcWdkmT9F3peaxF6Cp+
 YIrnRNJzkHqxSlyUXNMKzQfWNz1brBFPMQr2pANxbjd104qvXEZU0vgiFMh/BbwQovE0
 nr7QqgEghyTlw7fEztE0D1CJxXihWh7qjox54aMh4sweKy5b2XrPg78i17vvcoeazI4Y
 ukjWndztnmgiXoSdxh1FJPmGhSZVWIQblLAQCQGM5+Mfk2GjMuLFzPkVLf6y0zWBpcOo
 j5f9Fu4KUozbfcAU1mE5pWGx8XA/UiwpB+UGygvtrYBo9g0xKCqy9c+RtAsiB3y79oyS
 aCXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771321224; x=1771926024;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bFebxt70OffaHIzG8AkL/K7ZwIi8ATS7zxwHzKYNTw4=;
 b=Mu1nQ34348Pu1BO/EOfya50IbiHVM0YMq2KkIdKLsk4Cqhycc6KXlcDKMJys6CAMBY
 dU43hKY72dG1CkcbrZYm/q5KvnLHcUiKXzSbVddU/g8Ge4DsMd2gRdUbsJB2yL91D5MS
 qtUI30da3xOLlZX79QL6AXabE5jmD/Rcylc+afaYIKn2XLNTflIkZfX56IxfEx6w9akx
 AmZFBk+BgYnIlmc31Cvrw0l3DgzPpdlVpMboHskQwdOgrp2U0bSATItljJBig9llX9X/
 6UKdyWtORFcz+1IeI20WRBvWl20TUFmFQhUs0wo44PUknvdoR82mOtG0d8u057oOehkZ
 UrGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjkNe+QUCUOgAr3Cu9XUdW6JcmAKIwbdKmoRsDGFGoddkkl4eVmLoYOodvbUJcbT27KNe4GIZlIL0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyM6GVAkzEC+Fp/f2IikwPYLZqidn3Rb1iQF1uFmrA1j8HY4NnJ
 RA4vas5Ez8mCSExIDsYf3J69NIkvNgGzJHBGytfViH5X/503knaVmihln/L6kyZfqnTRc5AzBWZ
 WIFOATcjTOSyb0uocqEMyeJRbzvyBH2Z8Tgg4pfwtaPNSg1vDmG1o9EYnTtLhI+Iiw0G93H0=
X-Gm-Gg: AZuq6aKXapfcaOQ60/uhGMj3i7t+1IefZ8I8CPlysgej+tuOP0KCDDOg6rMmI3FlGLa
 9rzc0ff86ZXy8KpYb7fa8vMkFEp5XcDH0QNNV4ikMs3BIs49IoOWWJrSyQRQGpdDJLw7VYl5dUL
 /NsEGr8oomHwzpBi616/aR9LGxo/Z/eoql8HJJde84rnqWdEpnEEh3mJuQMca9jAfOIPwmK685D
 kb4LQW7VZxkKiKVdlAVIX3htbNJJF4U4NZGy40DbsRAgSjsKmj4N7Q+3A/++rMHMJAJgp1bR81l
 gjU3H0Jk8SsxUt0McdltruBcuaVx2NSwW42N0Im9W32LrtGCKenROlUHYQlcBOazfnoKD3fW7ru
 HwvRrwHTHzcowPL4rF98/KrXYKbA4uvQVoBdDKT0CfxJ+I2nGewA8/2UzNoz8eelv/kC16kY/dS
 2Vkgs=
X-Received: by 2002:a05:620a:15b5:b0:8cb:52c2:6f19 with SMTP id
 af79cd13be357-8cb52c271aamr616330085a.7.1771321224458; 
 Tue, 17 Feb 2026 01:40:24 -0800 (PST)
X-Received: by 2002:a05:620a:15b5:b0:8cb:52c2:6f19 with SMTP id
 af79cd13be357-8cb52c271aamr616328485a.7.1771321224081; 
 Tue, 17 Feb 2026 01:40:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8fc73f7bf7sm329218166b.29.2026.02.17.01.40.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Feb 2026 01:40:23 -0800 (PST)
Message-ID: <0fd7a5f7-a983-498d-b18e-5a7efd910410@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:40:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: lemans: add mdss1 display device
 nodes
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
 dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
 swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
 jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
 sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
 alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
 quic_riteshk@quicinc.com, Mahadevan P <mahadevan.p@oss.qualcomm.com>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217071420.2240380-2-mkuntuma@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bqVBxUai c=1 sm=1 tr=0 ts=69943789 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=jOm0eYPikRZL3_VOfAkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfX8YAEeY1Cr/ld
 qnlA60OmaZYT+GfW6MLZQNnycewzrfL6fZGf4DAnKAUfOTfP9ySEOodHeu2S0xH99EH4IAPKtzd
 qmaPuYe8D7rL3y4yqlMnCqr5lfJ3+ptZYNHiavDNbF6OPWA0HSPcG1StZdzZCrMn588112dXjlw
 3fs4ntRu+BrXCHX3lGzdrnHEzrLgVkZVcD6JTebupD88ZxNyBdSf5AJTSNSSTE5wCAnhBC8k6Ko
 GxoxHxd1jy27LP9Vbgb1nupz/HaAvd0tVpHo72dTTy6IpudWCsUjM8ewNlzCA7y3mOndo2D9j15
 vI6GdRX1Hm0MSF78OD/0iSMITD8lHJBWdpGrcAanEqokE5MIADVGbnrp6M9s6s4MjRIqG07oAv9
 4ZKzEzugNGcafCG5gXu1Gaho+JFrdpff0Zl0lOmXYxrGzEJ5+ReapYINXShOJ7DE1Ze0KWxAdTi
 MAR8knJBWCvQ+IiSleg==
X-Proofpoint-GUID: SBndOb6Rh_FbI8RBDawLd8TLUhCWgUP0
X-Proofpoint-ORIG-GUID: SBndOb6Rh_FbI8RBDawLd8TLUhCWgUP0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602170079
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mkuntuma@qti.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:marijn.suijten@somainline.org,m:swboyd@chromium.org,m:mripard@kernel.org,m:abel.vesa@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robin.clark@oss.qualcomm.com,m:jessica.zhang@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:airlied@gmail.com,m:simona@ffwll.ch,m:alex.vinarskis@gmail.com,m:quic_mkuntuma@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:quic_rajeevny@quicinc.com,m:quic_vproddut@quicinc.com,m:dri-devel@lists.freedesktop.org,m:quic_riteshk@quicinc.com,m:mahadevan.p@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:alexvinarskis@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[qti.qualcomm.com,oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,quicinc.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: D3E9514A7E0
X-Rspamd-Action: no action

On 2/17/26 8:14 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> Add devicetree changes to enable second Mobile Display Subsystem (mdss1),
> Display Processing Unit(DPU), Display Port(DP) controllers and eDP PHYs
> on the Qualcomm Lemans platform.
> 
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

[...]

> +			mdss1_dp0_phy: phy@220c2a00 {
> +				compatible = "qcom,sa8775p-edp-phy";
> +
> +				reg = <0x0 0x220c2a00 0x0 0x200>,

Since you are going to resend already, please uniformly delete the \n
before 'reg'

lg otherwise

Konrad
