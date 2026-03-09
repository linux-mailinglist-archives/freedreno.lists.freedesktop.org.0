Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0JItBgzBrmmKIgIAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:46:04 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79292391A4
	for <lists+freedreno@lfdr.de>; Mon, 09 Mar 2026 13:46:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8163510E181;
	Mon,  9 Mar 2026 12:46:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ROReoo0M";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OJD2PGuH";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DC2310E4F5
 for <freedreno@lists.freedesktop.org>; Mon,  9 Mar 2026 12:46:01 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6297UlaT4030815
 for <freedreno@lists.freedesktop.org>; Mon, 9 Mar 2026 12:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=; b=ROReoo0MXa3SHxcQ
 h+ABp1i2quDUQ+GMylGjYGSws9QPYLqlo6eah4K/5vXekTfTVenTiFNRY1qHUnwi
 c3dZLFdMKaY2BRUwEpw7N8856E6iUObrdpJ1az1B9kRy7/THYJyapnsFv9zLsUB9
 RCXgRJQvKlELv1XOGlB5CWXKRD7HHcyI7HJfxqls3sn2amMSNcJGWxMhiA0OXQxy
 nq/1YIIlO27ttp3JtcS5X0Yu6FQPw3cHCDCA3JtK/2DcZmYFjTJhFN+K1YMm4ngf
 ffDs0esZXRmbfpSrzWJgj8Gdr/Z+aEZst9kH4yZE94kKH0EYgf/fomQQVc8lq7EU
 e4pM1Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vddn2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 12:46:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8cd8e89d19bso34612485a.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Mar 2026 05:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1773060360; x=1773665160;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=;
 b=OJD2PGuHAUarqsj3W047EsY5BCbr2H82JshpAR6rzmhgX54Asx/vRte/znQ7Z2i//4
 qMcxS0xBN0ZYsnmOoPXgUVsA9m8ctUD7NPDCUG4wYW/u278a5f73tE9B8QrdZPu6tMl2
 vCVm7Uzc1Q6CC/h4bU+knPa9Pg6CGF5fP8tMQnw4VPNmeuWSWPldA1XtnLx3zu/wRGoK
 IHfFcHR44dKYU9tYjKNEltJs+BIag9zvIc7XCbJb9vltF6wC3SIDvekXgeItUFzLXGht
 iF0wkEdSZfwchCuq8YFEetdXagZYK+ZlSGhMdWHo5/rdyt5mwwbDYbVW3flgHtTDXGYr
 My/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773060360; x=1773665160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y4ylvvIghDzwrA7ZoAXsm0B3qXsBRXCNb46+t52arhk=;
 b=isLZRblON7DYVDhXazxF+xqIf97GSYNuin218T96xs+5cy7JKqcc8Qaa4Qs8UOpGvB
 Q5NSJgHAp5b9seDjRsr7/UyDSgpJmlTsInfl0HjvMCORuCISoDdZsM5FM6ij0EQXitNp
 gOSZSgnXvfBb8G5EN0IpJNDb5xDbYDCdY82JLQ/+M1C6a3S9Z7zlDpbkKBSIJedhpwVj
 5CRKqIKQYBLJPaezaNPprzn7tDNmQt6L6Y/ivG/qkfqvzTEq2jrblOutBk7wfM/8Xzma
 cIXFQdC0hPiwCIHy5SpYGiLidWSzLxbkDrw0fSP6wXbPpxKvGKY3KZvMjGAkCVZhh02w
 xswQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkzYlYF4xHt3FpnOcTKg02EkXInJj2qE+So9W0bLq6Y4a9VFcWu9r8AUwwvcNRBIkWfcistqEPmz4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxW7TLK1yTcDsvJZwpUDYLREVsanGjvl2R/1uqAao+AJAy7IrGR
 LRjNr8256gLffq1eHyCh49GItXbwpYf+PFJGWfAJtubKD7P690QBBe6xENOLI0Tnds6QEHby03Q
 fhWtd1JCgXoiZOqQXgsF3WdrcUyQR6UQiivFxyWPK8IKohbea39QNifSpb9XN04fl9EcoxoU=
X-Gm-Gg: ATEYQzwGcr7weTUqnIplY8qNrOVc9z0bd4Iudm1gTdCJZeCt8RE27oZX/EpYuX5klvG
 cgm7QxmTy9vcm35UiLyvKR22uOMrVqmqKoJ2rfyqrHt6+N3SB3WhA9Qu3UkZbCdHbsn/JMlSVW5
 bOpwFCDKlrV8zzqkQPNYLQ8ms4T/y2BuVaUEsTutULR6qDWIn04J0SHd7YgLl/hURa8/4mrxZWw
 K/Q9bTKpnLge1Q7gxrV6/BWT2V2dLlz0Kz2IGQc1uoqFgyoWODfjbjqqvz3AkGznkDEH2qXxNUP
 5k7s7JdDJXHrfGmetMXmM+i4Fe8H1RvjXcA2aOvcnre1a5ACCzY7eh4k/KkEbPeH3c+Brrr/ajc
 XvAXNxQrmcD/UaSDhbgQpy/T5OJ0nSlMYkDk8STJvZfdAJ7uS30iLXDXyiDpoIrDX1TGyr2TG3D
 2WkrA=
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id
 af79cd13be357-8cd6d350fa7mr1065405185a.3.1773060359870; 
 Mon, 09 Mar 2026 05:45:59 -0700 (PDT)
X-Received: by 2002:a05:620a:6cc2:b0:8c6:ca3d:4e0a with SMTP id
 af79cd13be357-8cd6d350fa7mr1065402385a.3.1773060359436; 
 Mon, 09 Mar 2026 05:45:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-661a55a660csm3141140a12.33.2026.03.09.05.45.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Mar 2026 05:45:58 -0700 (PDT)
Message-ID: <9a67cc73-755f-449b-9be7-b8380eaff4e2@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 13:45:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/9] drm/msm/dp: Fix the ISR_* enum values
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
 <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-2-39c9d1fef321@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8FJe_Sf_5JrzSc_Qh5-ex9pPsCYRHegE
X-Proofpoint-GUID: 8FJe_Sf_5JrzSc_Qh5-ex9pPsCYRHegE
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69aec108 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hxhQaWjiUK3sto3hAJ4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExNiBTYWx0ZWRfX0N4LOaX7HOTV
 wuwVLOzNU8pJHK/RtysFEOt/4vsRoJjJdMuMCaSF95QtW6C8UpxAf0QUswlFn5Mj4oZUvUlTQXj
 YjG97IqmlW04i5b48g6rlOd3JojCZfiYFipgZ1oZCLzBUSLqHTdGS7QlwfwI8XAo2/QpmDVXo1w
 tYYfU4V+HoOWw7Uo3Hzu1L6xJvjUOQ1KQE6OwPdgHGR7+BT/hwgciyxHoP1vzWxAX+/jfRW3xs9
 BIRZn6dUrdXiqIf66pGGzKpRlilvIytUoBplDMyckvYehzLSQSTs75NjVMVCeLu2DAZ7D5N3ZUM
 mIT4DgES8oozgFu919G5vYkxmIDoCB5juODbyU8GzINJOeLDJQHANgbVNPAgmGPD9FDBrljtbDw
 fk8IFgsGV+HF/roZ4aWeOjiynTbARR9TjrED1ZxKb0jerIt/2YzPpbwB7xjibfnVCyNe+zgVB1m
 RIMViyeh0M3eivLzQMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090116
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
X-Rspamd-Queue-Id: B79292391A4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.987];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Action: no action

On 3/5/26 3:30 PM, Dmitry Baryshkov wrote:
> From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The ISR_HPD_* enum should represent values that can be read from the
> REG_DP_DP_HPD_INT_STATUS register. Swap ISR_HPD_IO_GLITCH_COUNT and
> ISR_HPD_REPLUG_COUNT to map them correctly to register values.
> 
> While we are at it, correct the spelling for ISR_HPD_REPLUG_COUNT.
> 
> Fixes: 8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
